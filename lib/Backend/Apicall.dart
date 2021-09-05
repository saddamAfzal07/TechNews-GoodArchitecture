import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:technews_archietecture/widget/Searchbar.dart';

Future<List> getdata() async {
  final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&pageSize=100&apiKey=bf0b7673f4634da19c160d0c3a3a7a8f"
      // + "&q=" +
      // Searchbar.SearchController.text
      ));
  Map data = jsonDecode(response.body);
  // print(data);
  return (data["articles"]);
}
