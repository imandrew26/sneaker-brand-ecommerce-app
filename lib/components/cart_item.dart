import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/item.dart';

class CartItem extends StatefulWidget {
  Item item;
  CartItem({
    super.key,
    required this.item,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeCartItemCart(){
    Provider.of<Cart>(context, listen: false).removeCartItem(widget.item);
  }
  @override
  Widget build(BuildContext context) {
    final discount = Provider.of<Cart>(context).getDiscount();

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(

        //item image
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            widget.item.imagePath,
            fit: BoxFit.cover,
          ),
        ),

        //item image path
        title: Text(widget.item.name),
        subtitle: (discount > 0)
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${double.parse(widget.item.price).toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' \$${(double.parse(widget.item.price) * (1 - discount)).toStringAsFixed(2)}', // Discounted price
                              style: TextStyle(
                                color: Colors.red.shade900, // Discounted price in red
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        '\$${double.parse(widget.item.price).toStringAsFixed(2)}', // Normal price without discount
                      ),
        trailing: IconButton(onPressed: removeCartItemCart, icon: const Icon(Icons.delete)),
      ),
    ); // ListTile
  }
}
