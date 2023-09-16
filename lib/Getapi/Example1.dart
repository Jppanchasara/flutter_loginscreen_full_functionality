// ignore: file_names
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loginscreen/Getapi/phone.dart';
import 'package:loginscreen/model/PostModel.dart';
import 'package:http/http.dart' as http;

class PostApi extends StatelessWidget {
  const PostApi({super.key});

  @override
  Widget build(BuildContext context) {
    List<PostModel> postlist = [];

    Future<List<PostModel>> getPostApi() async {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          postlist.add(PostModel.fromJson(i));
          log('done');
        }

        return postlist;
      } else {
        return postlist;
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Example One",
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey.shade100,
                        margin:const EdgeInsets.all(15),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             Phone(widget: )));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                        "Id :  ${snapshot.data![index].id.toString()} ",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              //ReusbalRow(title: "Id", value: snapshot.data![index].id.toString()),

                              ReusbalRow(
                                  title: "Title :",
                                  value:
                                      snapshot.data![index].title.toString()),
                              ReusbalRow(
                                  title: "Body :",
                                  value: snapshot.data![index].body.toString()),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }
}

// ignore: must_be_immutable
class ReusbalRow extends StatelessWidget {
  String title, value;
  ReusbalRow({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(value)
        ],
      ),
    );
  }
}
