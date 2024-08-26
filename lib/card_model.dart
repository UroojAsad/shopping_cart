class Cart{

  late final int? id;
  final String? productId;
  final String? productName;
  final int? initialPrice;
  final int? productPrice;
  final int? quantity;
  final String? unitTags;
  final String? images;

  Cart({
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.unitTags,
    required this.images,
    required this.id, });

Cart.fromMap(Map<dynamic,dynamic> res)
:     id = res['id'],
      productId = res['productId'],
      productName= res['productName'],
      initialPrice = res['initialPrice'],
      productPrice = res['productPrice'],
      quantity = res['quantity'],
      unitTags = res['unitTags'],
      images= res['images'];

Map<String,Object?> toMap(){
  return{
    'id' : id,
    'productId' : productId,
    'productName' : productName,
    'initialPrice': initialPrice,
    'productPrice': productPrice,
    'quantity': quantity,
    'unitTags': unitTags,
    'images':images,


  };
}
}


