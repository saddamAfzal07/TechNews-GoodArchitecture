import 'package:flutter/material.dart';
import 'package:technews_archietecture/Pages/aftersearch.dart';
import 'package:technews_archietecture/Utils/Colors.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);
  static TextEditingController SearchController = TextEditingController();

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 10, 5, 0),
            height: 50,
            decoration: BoxDecoration(
              color: Colorz.grey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 30),
              child: Center(
                child: TextField(
                  onSubmitted: (value) {
                    print(value);
                  },
                  controller: Searchbar.SearchController,
                  decoration: InputDecoration(
                      hintText: "Search Here", border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: InkWell(
            onTap: () {
              if ((Searchbar.SearchController.text).replaceAll(" ", "") == "") {
                print("User Don,t search properly");
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            searchcontroler(Searchbar.SearchController.text)));
              }
            },
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(color: Colorz.grey, shape: BoxShape.circle),
              child: Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}
