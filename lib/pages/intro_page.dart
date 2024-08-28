import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //logo
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('lib/images/nike-logo-slogan.png', height: 130),
                  ),
                  const SizedBox(height: 100),

                  /*
                  const Text(
                    "Just Do It",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  */
          
                //launch home
                GestureDetector(
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
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
                        "Shop Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                )
                ]
            )
          ,),
        )

    );
  }
}