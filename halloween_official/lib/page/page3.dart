import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var data;
  Future<List<Data>> getData() async {
    final response = await http
        .get(Uri.parse('https://berequirement.herokuapp.com/products'));
    data = jsonDecode(response.body.toString());

    DataModel model = DataModel.fromJson(data);
    return model.dataa!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Data>>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SizedBox(
                  // child: Padding(
                  //   padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data![2].name.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Item No .${snapshot.data![2].code}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Item Type: ${snapshot.data![2].type}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ("\$ ${snapshot.data![2].price.toString()}"),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data![2].image.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      //const SizedBox(height: 70),
                      // Container(
                      //   height: 50,
                      //   width: 200,
                      //   decoration: BoxDecoration(
                      //     color: Colors.black,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       'Buy Now',
                      //       style: GoogleFonts.poppins(
                      //         textStyle: const TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white,
                      //             fontSize: 18),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  //),
                );

                //),
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something went wrong!"),
                );
              }
            }
            return const Center(child: Text(''));
          }),
    );
  }
}
