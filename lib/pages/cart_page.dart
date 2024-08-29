import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/pages/home_page.dart';
import 'package:new_ecommerce_app/payment/create_payment.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/item.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/foundation.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  
  //handles successful payment
  void displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:Text("Payment successful!"), 
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0)
        ),
      );
      
      //after successful transaction...
      //navigate back to home/shop page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        )
      );

      //reset and remove items in user cart
      Provider.of<Cart>(context, listen: false).resetCart();


    } catch (e) {
      print('Payment process was canceled or failed: $e');
    }
  }

  //initializes payment sheet, payment amount
  Future<void> makePayment(BuildContext context) async {
    try {
      final paymentIntentData = await createPaymentIntent(
        Provider.of<Cart>(context, listen: false).getTotalPrice(), 
        'USD') ?? {};

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          style: ThemeMode.light,
          customFlow: false,
          merchantDisplayName: 'Nike',
        ),
      ).then((value) {
        displayPaymentSheet(context);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

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
                onTap: () => makePayment(context),
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
