import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/data_model.dart';
import 'homepage.dart';
//ignore: must_be_immutable

class ScreenPage extends StatefulWidget {
  final Data? products;
  const ScreenPage({
    super.key, this.products,
  }); //required this.products});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
