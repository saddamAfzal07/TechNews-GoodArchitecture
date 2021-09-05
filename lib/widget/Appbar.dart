import 'package:flutter/material.dart';
import 'package:technews_archietecture/Utils/Colors.dart';
import 'package:technews_archietecture/Utils/Text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: Colorz.black,
      elevation: 1,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              modifiedtext("Global", 20, Colorz.primary),
              boldtext("News", 20, Colorz.white),
            ],
          )),
    );
  }
}
