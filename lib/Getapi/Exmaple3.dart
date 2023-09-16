import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loginscreen/model/UserModel.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatelessWidget {
  ExampleThree({super.key});

  List<UserModel> userlist = [];
  Future<List<UserModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userlist.add(UserModel.fromJson(i));
      }

      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Example Three",
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
            if(!snapshot.hasData){
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 6,
                      ),
                      SizedBox(height: 15,),
                      Text("Loading...",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                    ],
                  ),
                );
              
            }
            else{
              return ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusebalRow(title: "id :", value: snapshot.data![index].id.toString()),
                          ReusebalRow(title: "Name :", value: snapshot.data![index].name.toString()),
                          ReusebalRow(title: "User Name :", value: snapshot.data![index].username.toString()),
                          ReusebalRow(title: "Email :", value: snapshot.data![index].email.toString()),
                          ReusebalRow(title: "Address :", value: '',),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusebalRow(title: '', value:snapshot.data![index].address!.street.toString() ),
                                ReusebalRow(title: '', value:snapshot.data![index].address!.city.toString() ),
                                ReusebalRow(title: '', value:snapshot.data![index].address!.suite.toString() ),
                                ReusebalRow(title: '', value:snapshot.data![index].address!.zipcode.toString() ),
                                
                              ],
                            ),
                          ),
                          ReusebalRow(title: "Phone :", value:snapshot.data![index].phone.toString()),
                          ReusebalRow(title: "Web-site :", value: snapshot.data![index].website.toString()),
                          ReusebalRow(title: "Company :", value: snapshot.data![index].company!.name.toString()),
                        ],
                      ),
                    ),
                  );
                });

            }
            
          }),
    );
  }
}

class ReusebalRow extends StatelessWidget {
  String title, value;
   ReusebalRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Text(value,style: const TextStyle(fontSize: 15),)
      ],
    );
  }
}
