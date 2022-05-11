import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstorage/view/homepage/home_page.dart';

void main(List<String> args) {
   GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}