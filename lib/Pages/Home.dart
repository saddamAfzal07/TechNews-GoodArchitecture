import 'package:flutter/material.dart';
import 'package:technews_archietecture/Backend/Apicall.dart';
import 'package:technews_archietecture/Constant/image.dart';

import 'package:technews_archietecture/Utils/Colors.dart';
import 'package:technews_archietecture/Utils/Text.dart';
import 'package:technews_archietecture/widget/Appbar.dart';
import 'package:technews_archietecture/widget/Category.dart';
import 'package:technews_archietecture/widget/Newsbox.dart';
import 'package:technews_archietecture/widget/Searchbar.dart';
import 'package:technews_archietecture/widget/categorybox.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorz.black,
      appBar: appbar(),
      body: Column(
        children: [
          Searchbar(),
//Category Portion
          categorybox(),
//NewsBox
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: FutureBuilder<List>(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // print("getting data");
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Nesbox(
                              imageurl:
                                  snapshot.data![index]["urlToImage"] != null
                                      ? snapshot.data![index]["urlToImage"]
                                      : Constant.image,
                              title: snapshot.data![index]["title"]
                                          .toString()
                                          .length >
                                      70
                                  ? snapshot.data![index]["title"]
                                      .toString()
                                      .substring(0, 65)
                                  : snapshot.data![index]["title"],
                              time: snapshot.data![index]["publishedAt"],
                              description: snapshot.data![index]["description"]
                                  .toString(),
                              url: snapshot.data![index]["url"],
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colorz.primary,
                        ),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
