// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//import 'package:badges/badges.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:halloween_official/cart/cart_bag.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import 'menu_bar.dart' as menu_bar;
import 'package:badges/badges.dart' as badges;
import '../api/infor_product.dart';
import '../controller/cart_controller.dart';
import '../model/data_model.dart';
import '../page/page1.dart';
import '../page/page2.dart';
import '../page/page3.dart';

class HomePage extends StatefulWidget {
  final Data? product;

  const HomePage({
    super.key,
    this.product,
    //required product,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late List<Data> product;

  CartController cartController = Get.find();
  List<Information> postList = [];
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<List<Data>> getData() async {
    final response = await http
        .get(Uri.parse('https://berequirement.herokuapp.com/products'));
    var data = jsonDecode(response.body.toString());

    DataModel model = DataModel.fromJson(data);
    return model.dataa!;

    //   if (response.statusCode == 200) {
    //   for (Map i in data) {
    //     postList.add(Information.fromJson(i));
    //   }
    //   return postList;
    // } else {
    //   return postList;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 25),
          child: Row(children: [
            Container(
              alignment: Alignment.bottomRight,
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/logo_bar.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              'Dino Ghost',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddToCart(),
                  ),
                );
              },
              child: badges.Badge(
                badgeContent:
                    Obx(() => Text(cartController.total.value.toString())),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/shopping_bag.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const menu_bar.MenuBar(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                  height: 15,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/menu_bar.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 50),
          child: SizedBox(
            height: 40,
            width: 200,
            child: Text(
              '#Dino Ghost',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: FutureBuilder<List<Data>>(
        //       future: getData(),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.done) {
        // if (snapshot.hasData) {
        //
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: SizedBox(
                height: 450,
                width: 400,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: const [Page1(), Page2(), Page3()],
                ),
              ),
            ),
            //  Positioned(
            //     top: 450,
            //     right: 160,
            //     child: Center(

            //       // child: Positioned(
            //       //   bottom: 40,
            //       //   right: 160,
            //         child: SmoothPageIndicator(
            //           controller: _controller,
            //           count: 3,
            //           effect: const ExpandingDotsEffect(
            //               activeDotColor: Colors.black,
            //               dotColor: Colors.black,
            //               dotHeight: 10,
            //               dotWidth: 10),
            //         ),
            //      // ),
            //     ),
            //   ),
          ],
        ),
        Center(
          child: Positioned(
            bottom: 40,
            //   right: 160,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.black,
                  dotColor: Colors.black,
                  dotHeight: 10,
                  dotWidth: 10),
            ),
          ),
        ),

        const SizedBox(height: 30),

        BuyButton(),
      ]),
    );
    // }
  }
}

// Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       List.generate(data.length, (index) => buildDot(index, context))
//     ],
// )
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
//ignore: must_be_immutable
}
//ignore: must_be_immutable

class BuyButton extends StatefulWidget {
  final Data? products;
  //final Data product;
  //final data = GlobalKey<_HomePageState>();

  const BuyButton({
    Key? key,
    this.products,
  }) : super(key: key);

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  CartController cartController = Get.find();
//final box = GetStorage();
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isAdded = isAdded.toggle();
        setState(() {});

        cartController.addItemInCart(widget.products);
      },
      child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          //child: Center(
          child: isAdded
              ? Center(
                  child: Text(
                    'Buy More',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                )
          //),
          ),
    );
  }
}
// var cartItem = CartModel(
        //     name: widget.products!.name,
        //     code: widget.products!.code,
        //     type: widget.products!.type,
        //     price: widget.products!.price,
        //     image: widget.products!.image,
        //     quantity: 1);
        // if (isExistInCart(cartController.cart, cartItem)) {
        //   //If cartItems already available, just update quantity

        //   var updatedIndex = cartController.cart
        //       .indexWhere((e) => e.name == widget.products!.name);
        //   var productUpdate = cartController.cart
        //       .firstWhere((element) => element.name == widget.products!.name);
        //   productUpdate.quantity += 1;
        //   cartController.cart.insert(updatedIndex, productUpdate);
        // } else {
        //   cartController.cart.add(cartItem);
        // }
        //cartController.cart.insert(1, cartItem);