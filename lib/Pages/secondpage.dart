import 'package:first_project/Pages/finalpage.dart';
import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'finalpage.dart';

class MyListView2 extends StatefulWidget {
  final List<String> selectedItems;
  final List<String> selectedItemsrate;
  final List<String> selectedItemsurl;

  MyListView2(
      {required this.selectedItems,
      required this.selectedItemsurl,
      required this.selectedItemsrate});

  @override
  MyListViewState2 createState() => MyListViewState2();

  List<String> getSelectedItems() {
    return selectedItems;
  }

  List<String> getSelectedItemsurl() {
    return selectedItemsurl;
  }

  List<String> getSelectedItemsrate() {
    return selectedItemsrate;
  }
}

class MyListViewState2 extends State<MyListView2> {
  List<String> selectedItems2 = [];
  List<String> selectedItemsurl2 = [];
  List<String> selectedItemsrate2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Fruit',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/images/fruit.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(children: [
              ListTile(
                title: Text(
                    '     Items                                     Price/kg'),
              ),
              for (int i = 0; i < 5; i++)
                buildFruitTile(
                    _shopItems2[i][0], _shopItems2[i][1], _shopItems2[i][2]),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyListView()),
                );
              },
              child: Text('Go back',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 30),
                textStyle: TextStyle(fontSize: 16),
                primary: Colors.green,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BillPage(
                      selectedFruit: selectedItems2,
                      selectedFruiturl: selectedItemsurl2,
                      selectedFruitrate: selectedItemsrate2,
                      selectedVegetables: widget.getSelectedItems(),
                      selectedVegetablesurl: widget.getSelectedItemsurl(),
                      selectedVegetablesrate: widget.getSelectedItemsrate(),
                    ),
                  ),
                );
              },
              child: Text('Pay',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 30),
                textStyle: TextStyle(fontSize: 16),
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List _shopItems2 = const [
    // [ itemName, itemPrice, imagePath, color ]
    ['Apple', 'lib/images/apple.jpeg', '90'],
    ['Mango', 'lib/images/mango.jpg', '60'],
    ['Guvava', 'lib/images/guvava.webp', '40'],
    ['Melon', 'lib/images/melon.jpeg', '70'],
    ['Watermelon', 'lib/images/watermelon.jpeg', '50'],
  ];

  ListTile buildFruitTile(String itemName, String imageUrl, String price) {
    bool isSelected = selectedItems2.contains(itemName);

    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(imageUrl)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName),
          Text('Price: $price'),
        ],
      ),
      trailing: Checkbox(
        value: isSelected,
        onChanged: (value) {
          setState(() {
            if (value!) {
              selectedItems2.add(itemName);
              selectedItemsurl2.add(imageUrl);
              selectedItemsrate2.add(price);
            } else {
              selectedItems2.remove(itemName);
              selectedItemsurl2.remove(imageUrl);
              selectedItemsrate2.remove(price);
            }
          });
        },
      ),
    );
  }
}
