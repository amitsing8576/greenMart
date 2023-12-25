import 'package:first_project/Pages/homepage.dart';
import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'secondpage.dart';

class BillPage extends StatelessWidget {
  final List<String> selectedFruit;
  final List<String> selectedFruiturl;
  final List<String> selectedFruitrate;
  final List<String> selectedVegetables;
  final List<String> selectedVegetablesurl;
  final List<String> selectedVegetablesrate;

  // Constructor to receive selected items from previous pages
  BillPage({
    required this.selectedFruit,
    required this.selectedFruiturl,
    required this.selectedFruitrate,
    required this.selectedVegetables,
    required this.selectedVegetablesurl,
    required this.selectedVegetablesrate,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice =
        calculateTotalBill(selectedVegetablesrate, selectedFruitrate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Bill Payment',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Items:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedVegetables.length + selectedFruit.length,
              itemBuilder: (context, index) {
                if (index < selectedVegetables.length) {
                  String selectedItem = selectedVegetables[index];
                  String selectedItemurl = selectedVegetablesurl[index];
                  String selectedItemrate = selectedVegetablesrate[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(selectedItemurl)),
                    title: Text(selectedItem),
                    trailing: Text(
                      selectedItemrate,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  String selectedItem =
                      selectedFruit[index - selectedVegetables.length];
                  String selectedItemurl =
                      selectedFruiturl[index - selectedVegetables.length];
                  String selectedItemrate =
                      selectedFruitrate[index - selectedVegetables.length];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(selectedItemurl)),
                    title: Text(selectedItem),
                    trailing: Text(
                      selectedItemrate,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
            ),
          ),
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Bill: $totalPrice',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45,
          )
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
              child: Text('Home',
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
                Text('Order Placed');
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

  double calculateTotalBill(
      List<String> selectedVegetablesrate, List<String> selectedFruitrate) {
    double total = 0;
    for (int i = 0; i < selectedVegetablesrate.length; i++) {
      total += int.parse(selectedVegetablesrate[i]);
    }
    for (int i = 0; i < selectedFruitrate.length; i++) {
      total += int.parse(selectedFruitrate[i]);
    }

    return total;
  }
}
