import 'package:flutter/material.dart';

import 'home_page.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final Color color;
  final String imagePath;

  ProductDetailsScreen({
    required this.title,
    required this.description,
    required this.price,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    child: SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        imagePath,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white30,
                      radius: 25,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          detail_widget(
            title: title,
            price: price,
            description: description,
            color: color,
            isTitleBelow: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20, bottom: 10),
            child: Text(
              "About Product",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20),
            child: Text(description),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text("Add to Bag", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
