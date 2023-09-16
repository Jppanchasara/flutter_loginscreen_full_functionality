import 'package:flutter/material.dart';

import '../model/ProductModel.dart';

class Phone extends StatefulWidget {
  final ProductModel postmodel;
  const Phone({required this.postmodel, super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
    );
  }
}
