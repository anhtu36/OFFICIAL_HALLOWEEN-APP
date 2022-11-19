// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halloween_official/screens/homepage.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({super.key});

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  List<String> categories = ["Ghost", "Pumpkin", "Bat", "Customize"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        SizedBox(
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: Image.asset("images/back.png"),
          ),
        ),
        const SizedBox(
          width: 30,
        )
      ]),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        color: Colors.white,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => buildMenuBar(index),
        ),
      ),
    );
  }

  Widget buildMenuBar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              categories[index],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 24,
                color: selectedIndex == index ? Colors.black : Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 2,
              width: 100,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

// return 
            