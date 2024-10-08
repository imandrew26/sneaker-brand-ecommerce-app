import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemTile extends StatelessWidget {
  Item item;
  void Function()? onTap;
  ItemTile({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(item.imagePath),
          ),

          //description
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              item.description,
              style: TextStyle(
                color: Colors.grey[500]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // item name
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )
                      
            
                    ),
                    // item price
                    Text(
                      '\$${item.price}',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15
                      )
                    )
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black, 
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)
                      )),
                      
                    child: const Icon(Icons.add, color: Colors.white,),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}