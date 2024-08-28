import 'package:flutter/material.dart';
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
        backgroundColor: Colors.white,
        title: Text("Added to cart!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        
        children: [
          //search bar
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: .5,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search", style: TextStyle(color: Colors.grey),),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  //coupon message
                  const Text(
                    'Extra 20% Off: Use code BACKTOSCHOOL',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  
                  //item carousel for "Best Sellers"
                  SizedBox(
                    height: 470,
                    child: Consumer<Cart>(
                      builder: (context, value, child) {
                        // Filter list to only include items that are bestsellers
                        List<Item> bestSellers = value.getItemList().where((item) => item.bestseller == true).toList();
                  
                        return ListView.builder(
                          itemCount: bestSellers.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 25),
                          itemBuilder: (context, index) {
                            Item item = bestSellers[index];
                            return ItemTile(
                              item: item,
                              onTap: () => addCartItemShop(item),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  //item carousel for "New Arrivals"
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'New Arrivals 🚀',
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
                  
                  //carousel for new arrivals
                  
                  SizedBox(
                    height: 470,
                    child: Consumer<Cart>(
                      builder: (context, value, child) {
                        List<Item> newArrivals = value.getItemList().where((item) => item.newarrival == true).toList();
                  
                        return ListView.builder(
                          itemCount: newArrivals.length,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 25),
                          itemBuilder: (context, index) {
                            Item item = newArrivals[index];
                            return ItemTile(
                              item: item,
                              onTap: () => addCartItemShop(item),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          
          
        ],
      )
    );
  }
}