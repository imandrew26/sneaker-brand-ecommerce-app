import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/pages/intro_page.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: value.getCartList().length,
                itemBuilder: (context, index) {
                // get individual shoe
                  Item tempItem = value.getCartList()[index];

                // return the cart item
                return CartItem(item: tempItem);
              }),
            ),

            //checkout button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => IntroPage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10)
                          
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
