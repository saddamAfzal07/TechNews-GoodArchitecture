import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:technews_archietecture/Utils/Colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:technews_archietecture/Utils/Text.dart';
import 'package:technews_archietecture/widget/webview.dart';

class Nesbox extends StatelessWidget {
  final String imageurl, title, time, description, url;

  const Nesbox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => webview(url)));
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(left: 5, right: 5, top: 2),
            width: MediaQuery.of(context).size.width,
            color: Colorz.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: Colorz.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        boldtext(title, 20.0, Colorz.white),
                        modifiedtext(time, 20.0, Colorz.white),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colorz.white,
        )
      ],
    );
  }
}
