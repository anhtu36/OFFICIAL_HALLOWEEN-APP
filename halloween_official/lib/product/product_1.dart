import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:halloween_official/cart/cart_counter.dart';
import 'package:halloween_official/model/data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Product1 extends StatefulWidget {
  const Product1({super.key});

  @override
  State<Product1> createState() => _Product1State();
}

class _Product1State extends State<Product1> {
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
    return FutureBuilder<List<Data>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Card(
                elevation: 0,
                color: Colors.grey.shade300,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                //borderRadius: const BorderRadius.all(Radius.circular(20)),

                child: Container(
                  height: 120,
                  width: 350,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data![0].image.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                snapshot.data![0].name.toString(),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.delete_outline_outlined))
                            ],
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 120),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "#Dino Ghost",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                            child: 
                            Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "\$${snapshot.data![0].price.toString()}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                               const SizedBox(width: 90),
                                CartCounter(),
                              ],
                            ),
                          ),
                          //)
                        ],
                      )
                    ],
                  ),
                ),
              );

              //),
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong!"),
              );
            }
          }
          return const Center(
            child: Text(''),
          );
        });
  }
}
