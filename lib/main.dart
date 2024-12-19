
import 'package:flutter/material.dart';
import 'package:item_store/item_controller.dart';
import 'package:provider/provider.dart';
import './item_screen.dart';

void main(){
  runApp(
    ChangeNotifierProvider(create: (context)=> ItemController(),
    child: MainApp(),)
  );
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemScreen(),
    );
  }
}