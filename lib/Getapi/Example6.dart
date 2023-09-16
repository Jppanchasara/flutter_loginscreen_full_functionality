import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:loginscreen/model/Requres.dart';

class ExampleSixUser extends StatelessWidget {
 const ExampleSixUser({super.key});

  Future<Reqres> getPostApi() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Reqres.fromJson(data);
    } else {
      return Reqres.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("User List"),
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
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black,width: 2)
                              ),
                              height: 120,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  
                                  children: [
                                    const SizedBox(height: 15,),
                                    Reusebaltext(title: "ID :", value: snapshot.data!.data![index].id.toString()),
                                    Reusebaltext(title: "Email :", value: snapshot.data!.data![index].email.toString()),
                                    Reusebaltext(title: "FIrst Name:", value: snapshot.data!.data![index].firstName.toString()),
                                    Reusebaltext(title: "Last Name:", value: snapshot.data!.data![index].lastName.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(top: 0,left: 40,
                            child: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!.data![index].avatar.toString()),
                          ))
                          ],
                      );
                    });
              }
            }));
  }
}

// ignore: must_be_immutable
class Reusebaltext extends StatelessWidget {
  String title, value;
  Reusebaltext({required this.title, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        const SizedBox(
          width: 8,
        ),
        Text(value,style: const TextStyle(fontSize: 14),)
      ],
    );
  }
}
