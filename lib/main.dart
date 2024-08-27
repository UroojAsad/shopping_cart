import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/cart_provider.dart';
import 'package:shopping_cart_app/product_list.dart';
import 'package:shopping_cart_app/db_helper.dart'; // Import DbHelper

void main() {
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final dbHelper = DbHelper();
 return ChangeNotifierProvider(
     create: (_) => CartProvider(),
 child: Builder(builder: (BuildContext context ){
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Flutter Demo',
     theme: ThemeData(

       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       useMaterial3: true,
     ),
     home: ProductListScreen(),
   );
 },),);
  }
}

