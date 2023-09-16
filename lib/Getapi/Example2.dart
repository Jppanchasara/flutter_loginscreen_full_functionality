import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Example2 extends StatelessWidget {
  Example2({super.key});
  List<Photos> photoslist = [];
  Future<List<Photos>> getPostAPi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i["title"], url: i["url"]);
        photoslist.add(photos);
      }
      return photoslist;
    } else {
      return photoslist;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Example Two",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getPostAPi(),
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
                  itemCount: photoslist.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: const [
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: const ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          
                          SlidableAction(
                            onPressed: doNothing,
                            backgroundColor: Color(0xFF0392CF),
                            foregroundColor: Colors.white,
                            icon: Icons.save,
                            label: 'Save',
                          ),
                        ],
                      ),
                      child:  ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].title.toString())),
                    );
                    // ListTile(
                    //   title: Text(snapshot.data![index].title.toString()),
                    //     leading: CircleAvatar(
                    //       backgroundImage: NetworkImage(
                    //           snapshot.data![index].url.toString()),
                    //     ),
                    //   );
                  });
            }
          }),
    );
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}

void doNothing(BuildContext context) {}