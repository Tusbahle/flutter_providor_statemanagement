import 'package:flutter/material.dart';

class ItemController extends ChangeNotifier{
  List<String> _items = [];

  List<String>  get items => _items;

  void addItem(String item){
    _items.add(item);
    notifyListeners();
  } 

  void removeItem(int index){
    _items.removeAt(index);
    notifyListeners();
  }

}