import 'package:flutter/material.dart';
import 'package:technews_archietecture/Utils/Colors.dart';

import 'Category.dart';

class categorybox extends StatelessWidget {
  List<String> items = [
    "Sports",
    "Business",
    "Health",
    "Science",
    "Technology",
    "Entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => category(items[index])));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colorz.primary,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Center(
                    child: Text(
                      items[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
