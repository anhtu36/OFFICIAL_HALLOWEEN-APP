import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/cart_controller.dart';
import '../model/data_model.dart';

class CartCounter2 extends StatelessWidget {
  Data? products;
  CartCounter2({super.key});

  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: buildButton(
              icon: Icons.remove,
              press: () {
                cartController.removeItem2();
              }),
        ),
        //
        Obx(
          () => Text(cartController.numOfItem2.value.toString(),
              //  .padLeft(2, "0"),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    //height: 1.5,
                    fontSize: 15),
              )),
        ),

        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: buildButton(
              icon: Icons.add,
              press: () {
                cartController.addItem2();
              }),
        )
      ],
    );
  }

  Widget buildButton({required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: IconButton(
        onPressed: () {
          press();
        },
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
