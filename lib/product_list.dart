import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<String> productName =['Mango', 'Grapes' , 'Orange', 'Banana' , 'Cheery' , 'Peach' , 'MixedFruit'] ;
  List<String> productUnit= ['KG' ,'Dozen', 'KG', 'Bozen', 'KG', 'KG', 'KG'];
  List<int> productPrice =[18, 20 ,30, 40, 58, 69, 70];
 List<String> productImage =[
   'images/Mango-removebg-preview.png',
   'images/grapes-removebg-preview.png',
   'images/Orange-removebg-preview.png',
   'images/bananna-removebg-preview (1).png',
   'images/rubyseedlessgrapes-removebg-preview.png',
   'images/peach-benefits-for-skin-1024x410-removebg-preview.png',
   'images/basket-removebg-preview.png',

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List',
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,

        actions: [
          Center(
            child: badges.Badge(
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),

              // position: badges.BadgePosition.topEnd(top: 0, end: 0),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView.builder(
        itemCount: productName.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Image.asset(productImage[index].toString(),
                        width:100,
                      height: 100,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productName[index].toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,),),
                            SizedBox(height: 5.0,),
                            Text( productUnit[index].toString()+ " " +r"$"+productPrice[index].toString(),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,),),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child: Text('Add to cart',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          );

      }),
    );
  }
}
