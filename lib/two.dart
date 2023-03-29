// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/main.dart';
import 'package:window_size/window_size.dart';


void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => increment(),
          child: MyApp()

      )
  );
}

class increment with ChangeNotifier {
  int count = 0;

  void inc() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        children: [
          Text("The Incremented value  : ${Provider
              .of<increment>(context)
              .count} "),
          ElevatedButton(onPressed: () {
            var cc=context.read<increment>();
            cc.inc();
          }, child: Text("Increment the value.."))
        ],
      ),


    );
  }
}
