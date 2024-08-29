import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/models/item.dart';
import 'item.dart';

class Cart extends ChangeNotifier{

  //list of items for sale

  List<Item> itemShop = [
    Item(
      name: 'Air Jordan 4 Retro',
      price: "240",
      imagePath: 'lib/images/jordan-4-green.png',
      description: 'This AJ4 throws it back with full-grain and synthetic leathers and premium textiles.',
      bestseller: true,
      newarrival: false,
    ),
    Item(
      name: 'Zion 3 "Fresh Paint"',
      price: "140",
      imagePath: 'lib/images/zion-3-paint.png',
      description: 'This clean and essential special edition channels a Jordan icon with a Zion twist.',
      bestseller: true,
      newarrival: false,
    ),
    Item(
      name: 'Air Jordan 1 Retro High',
      price: "180",
      imagePath: 'lib/images/jordan-1-fif.png',
      description: 'This iteration of the AJ1 reimagines Mike\'s signature model with a fresh mix of colors.',
      bestseller: true,
      newarrival: false,
    ),
    Item(
      name: 'Luka 3 "Speedway"',
      price: "130",
      imagePath: 'lib/images/luka-3-black.png',
      description: 'Black and white are all your opponents will see as you sink quick buckets past them.',
      bestseller: true,
      newarrival: false,
    ),
    Item(
      name: 'Air Jordan 3 Retro',
      price: "200",
      imagePath: 'lib/images/jordan-3-grey.png',
      description: 'With luxurious elephant print, the AJ3 returns with its classic style and grace.',
      bestseller: true,
      newarrival: false,
    ),
    Item(
      name: 'Luke 3 "Blurred Vision"',
      price: "130",
      imagePath: 'lib/images/luka-3-bv.png',
      description: 'Armed with plenty of court-ready tech, colors blend together and Luka scores.',
      bestseller: false,
      newarrival: true,
    ),
    Item(
      name: 'Zion 3 M.U.D. "Bone"',
      price: "150",
      imagePath: 'lib/images/zion-3-bone.png',
      description: 'The special-edition strap and nubuck leather lets you customize your game.',
      bestseller: false,
      newarrival: true,
    ),
    Item(
      name: 'Tatum 1 "Arena Fits"',
      price: "170",
      imagePath: 'lib/images/tatum-1-af.png',
      description: 'Play your best in a performance shoe inspired by JT\'s legendary off-court style.',
      bestseller: false,
      newarrival: true,
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

  //add cart item
  void addCartItem(Item item){
    userCart.add(item);
    notifyListeners();
  }

  //remove cart item
  void removeCartItem(Item item){
    userCart.remove(item);
    notifyListeners();
  }

  //resets cart
  void resetCart(){
    userCart = [];
  }

  //return total price as string (in cents)
  String getTotalPrice(){
    int sum = 0;
    for (Item item in userCart) {
      sum += int.parse(item.price); // Convert string to int
    }
    sum *= 100;
    return sum.toString();
  }

}