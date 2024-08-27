import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ecommerce_app/components/item_tile.dart';
import 'package:new_ecommerce_app/models/item.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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

        Expanded(
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              Item item = Item(
                name: 'Air Jordan 4 Pine',
                price: "240",
                imagePath: 'lib/images/jordan-4-green.png',
                description: 'description'
              );
              return ItemTile(
                item: item,
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
    );
  }
}