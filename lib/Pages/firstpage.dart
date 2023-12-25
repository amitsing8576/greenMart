import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'homepage.dart';

class MyListView extends StatefulWidget {
  @override
  MyListViewState createState() => MyListViewState();
}

class MyListViewState extends State<MyListView> {
  List<String> selectedItems = [];
  List<String> selectedItemsurl = [];
  List<String> selectedItemsrate = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Vegetables',
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
                'lib/images/vegetables.jpeg',
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
                buildVegetableTile(
                    _shopItems[i][0], _shopItems[i][1], _shopItems[i][2]),
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
                  MaterialPageRoute(builder: (context) => HomePage()),
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
                    builder: (context) => MyListView2(
                      selectedItems: selectedItems,
                      selectedItemsurl: selectedItemsurl,
                      selectedItemsrate: selectedItemsrate,
                    ),
                  ),
                );
              },
              child: Text('Go to Fruits',
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

  final List _shopItems = const [
    ['Potatoes', 'lib/images/potatoes.jpeg', '25'],
    ['Cauliflower', 'lib/images/cauliflower.jpeg', '30'],
    ['Brinjal', 'lib/images/brinjal.webp', '40'],
    ['Cabbage', 'lib/images/cabbage.jpeg', '20'],
    ['Peas', 'lib/images/peas.webp', '25'],
  ];

  ListTile buildVegetableTile(String itemName, String imageUrl, String price) {
    bool isSelected = selectedItems.contains(itemName);

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
              selectedItems.add(itemName);
              selectedItemsurl.add(imageUrl);
              selectedItemsrate.add(price);
            } else {
              selectedItems.remove(itemName);
              selectedItemsurl.remove(imageUrl);
              selectedItemsrate.remove(price);
            }
          });
        },
      ),
    );
  }
}
