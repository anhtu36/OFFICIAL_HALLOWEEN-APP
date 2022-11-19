import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_official/cart/shipping.dart';
import 'package:halloween_official/model/product.dart';
import 'package:halloween_official/product/product_1.dart';
import 'package:halloween_official/product/product_2.dart';
import 'package:halloween_official/product/product_3.dart';

import '../controller/cart_controller.dart';
import '../screens/homepage.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Shopping Cart ( ${cartController.total.value.toString()} item )",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/back.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 300,
        // ),
        // Expanded(
        //     child: ListView.builder(
        //   itemCount: product.length,
        //   itemBuilder: (context, index) {
        //     return SingleChildScrollView(
        //       child: product[0],
        //     );
        //   },
        // )),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          width: 370,
          child: ListView(
            children: const [Product1(), Product2(), Product3()],
          ),
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Text(
              "Total Price:  \$${574} ",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 200),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShippingMethod(),
                    ),
                  );
                },
                child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //child: Center(

                    child: Center(
                      child: Text(
                        'Continue To Shipping',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    )
                    //),
                    ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
