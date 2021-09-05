import 'package:flutter/material.dart';
import 'package:technews_archietecture/Constant/image.dart';

import 'package:technews_archietecture/Utils/Colors.dart';
import 'package:technews_archietecture/Utils/Text.dart';
import 'package:technews_archietecture/widget/Appbar.dart';
import 'package:technews_archietecture/widget/Newsbox.dart';
import 'package:technews_archietecture/widget/Searchbar.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:technews_archietecture/widget/Searchbar.dart';

class searchcontroler extends StatelessWidget {
  String query;
  searchcontroler(this.query);
  Future<List> getsearch() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&from=2021-09-05&apiKey=bf0b7673f4634da19c160d0c3a3a7a8f"));
    Map data = jsonDecode(response.body);

    return (data["articles"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorz.black,
      appBar: AppBar(
        backgroundColor: Colorz.black,
        title: boldtext(query, 20.0, Colorz.primary),
      ),
      body: Column(
        children: [
          Searchbar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: FutureBuilder<List>(
                  future: getsearch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("getting data");
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
