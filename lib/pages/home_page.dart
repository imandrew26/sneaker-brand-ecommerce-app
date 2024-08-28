import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //controls bottom nav bar
   int _selectedIndex = 0;

   void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
   }

   //pages to display
   final List <Widget> _pages = [

    const ShopPage(),
    const CartPage()
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      //opens sidebar
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.grey[300],
        //surfaceTintColor: Colors.grey[900],
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu));
          }
        ),
      ),
      //sidebar with logo and buttons
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                  Container(
                    padding: const EdgeInsets.only(top: 25.0),
                    height: 170,
                    child: Image.asset(
                      'lib/images/nike-logo.png',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  //sidebar buttons
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white,),
                      title: Text("Home",
                      style: TextStyle( color: Colors.white),),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.info, color: Colors.white,),
                      title: Text("About",
                      style: TextStyle( color: Colors.white),),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white,),
                    title: Text("Account",
                    style: TextStyle( color: Colors.white),),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 15.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text("Logout",
                style: TextStyle( color: Colors.white),),
              ),
            ),
          ],
        ),
      
      ),
      body: _pages[_selectedIndex],
    );
  }
}