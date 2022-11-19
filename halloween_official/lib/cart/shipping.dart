import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_official/cart/shipping_page2.dart';

import '../screens/homepage.dart';

class ShippingMethod extends StatefulWidget {
  const ShippingMethod({super.key});

  @override
  State<ShippingMethod> createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  final _textController3 = TextEditingController();

  final _textController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "Shipping ",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 150),
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
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 170),
          child: Text(
            "Shipping Information ",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: const <Widget>[
              Text(
                "Full name",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '*',
                style: TextStyle(color: Colors.deepOrangeAccent),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _textController1,
                decoration: InputDecoration(
                  hintText: "Full name",
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController1.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: const <Widget>[
              Text(
                "Email",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '*',
                style: TextStyle(color: Colors.deepOrangeAccent),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _textController2,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController2.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: const <Widget>[
              Text(
                "Phone",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '*',
                style: TextStyle(color: Colors.deepOrangeAccent),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _textController3,
                decoration: InputDecoration(
                  hintText: "Phone",
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController3.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: const <Widget>[
              Text(
                "Address",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '*',
                style: TextStyle(color: Colors.deepOrangeAccent),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _textController4,
                decoration: InputDecoration(
                  hintText: "Address",
                  hintStyle: const TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController4.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShippingFee(),
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
                    'Continue To Method',
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
      ]),
    );
  }
}
