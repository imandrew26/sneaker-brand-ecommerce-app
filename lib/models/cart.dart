import 'package:new_ecommerce_app/models/item.dart';

class Cart{

  //list of items for sale

  List<Item> itemShop = [
    Item(
      name: 'Air Jordan 4 Pine',
      price: "240",
      imagePath: 'lib/images/jordan-4-green.png',
      description: 'description'
    ),
    Item(
      name: 'Air Max 97 Triple White',
      price: "170",
      imagePath: 'lib/images/air-max-97-mens-shoes-LJmK45.png',
      description: 'description'
    ),
    Item(
      name: 'Pegasus 41 Electric Blue',
      price: "140",
      imagePath: 'lib/images/pegasus-41-mens-road-running-shoes-7S90QB.png',
      description: 'description'
    ),
  ];

  //list for what user adds to cart
  List<Item> userCart = [];

  //get list of items for sale
  List<Item> getItemList(){
    return itemShop;
  }

  //return the user's cart
  List<Item> getCartList(){
    return userCart;
  }

}