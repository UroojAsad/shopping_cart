import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart_app/db_helper.dart';

import 'card_model.dart';

class CartProvider with ChangeNotifier{

  DbHelper db =DbHelper();
  int _counter=0;
  int get counter => _counter;

  double _totalPrice =0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;


  Future<List<Cart>>? _cartFuture; // Store the Future

  Future<List<Cart>> getData() {
    if (_cartFuture == null) {
      print("Fetching data from the database for the first time...");
      _cartFuture = db.getCartList().then((value) {
        print("Data fetched: ${value.length} items");
        return value;
      });
    }
    return _cartFuture!;
  }



  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }


  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter =prefs.getInt('cart_items') ?? 0;
    _totalPrice =prefs.getDouble('total_price') ?? 0;
    notifyListeners();
  }

  void  addTottlePrice( double productPrice){
    _totalPrice= _totalPrice+ productPrice;
    _setPrefItems();
    notifyListeners();
  }

  void  removeTotalPrice(double productPrice){
    _totalPrice= _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice(){
    _setPrefItems();
    return _totalPrice;
  }



void  addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();
}

  void  removeCounter(){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

 int  getCounter(){
   _setPrefItems();
    return _counter;
  }

}