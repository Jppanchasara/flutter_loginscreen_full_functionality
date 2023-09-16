import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginscreen/model/Phone.dart';

class ExampleSeven extends StatefulWidget {
  const ExampleSeven({super.key});

  @override
  State<ExampleSeven> createState() => _ExampleSevenState();
}

class _ExampleSevenState extends State<ExampleSeven> {
  var dataProduct = [];
  Future<void> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    var data = jsonDecode(response.body);
    setState(() {
      dataProduct = data["products"];
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Example Five",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(dataProduct[10]['title']),
      ),
      // body: FutureBuilder<PhoneModel>(
      //     future: getPostApi(),
      //     builder: (context, snapshot) {
      //       return ListView.builder(
      //           itemCount: snapshot.data!.products!.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               child: Text(snapshot.data!.total.toString()),
      //             );
      //           });
      //     })
    );
  }
}
