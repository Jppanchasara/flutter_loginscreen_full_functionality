import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginscreen/Getapi/phone.dart';
import 'package:loginscreen/model/PostModel.dart';
import 'package:loginscreen/model/ProductModel.dart';
import 'package:loginscreen/model/Requres.dart';

class ExampleFive extends StatelessWidget {
  const ExampleFive({super.key});

  Future<ProductModel> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/083ca141-3503-471a-b177-f93908514fec'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
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
      body: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 6,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Loading...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    isAntiAlias: true,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(snapshot
                                        .data!.products![index].image
                                        .toString())),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.products![index].name
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(snapshot.data!.products![index].desc
                                          .toString()),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Price \$${snapshot.data!.products![index].price.toString()}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            
                                           
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Center(
                                                child: Text(
                                              "View",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  });
            }
          }),
    );
  }
}
