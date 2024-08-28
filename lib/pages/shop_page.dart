import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ecommerce_app/components/item_tile.dart';
import 'package:new_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart with provider
  void addCartItemShop(Item item){
    Provider.of<Cart>(context, listen: false).addCartItem(item);

    showDialog(context: context, 
    builder: (context) => const AlertDialog(
        title: Text("Item successfully added!"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search", style: TextStyle(color: Colors.grey),),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Best Sellers 🔥',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          
          //item carousel
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 25),
              itemBuilder: (context, index){
                Item item = value.getItemList()[index];
                return ItemTile(
                  item: item,
                  onTap: () => addCartItemShop(item),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      )
    );
  }
}