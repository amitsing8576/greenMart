import 'package:flutter/material.dart';
import 'firstpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Green Mart',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('lib/images/logo.jpg'),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Welcome to Green Mart',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 55,
        ),
        GestureDetector(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyListView()),
              );
            },
            child: Text('Continue',
                style: TextStyle(
                  color: Colors.white,
                )),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(240, 65),
              textStyle: TextStyle(fontSize: 28),
              primary: Colors.green,
            ),
          ),
        )
      ]),
    );
  }
}
