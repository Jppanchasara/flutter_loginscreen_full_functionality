import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:http/http.dart' as http;

class ExampleFour extends StatelessWidget {
  ExampleFour({super.key});
  var data;
  Future<void> getPostApi() async {
    final Response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (Response.statusCode == 200) {
      data = jsonDecode(Response.body.toString());
    }
    else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Example Four",
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
            if(snapshot.connectionState==ConnectionState.waiting){
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(

                    
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusebalRow(title: "id :", value: data[index]['id'].toString()),
                          ReusebalRow(title: "Name :", value: data[index]['name'].toString()),
                          ReusebalRow(title: "User Name :", value: data[index]['username'].toString()),
                          ReusebalRow(title: "Email :", value: data[index]['emial'].toString()),
                          ReusebalRow(title: "Address :", value: '',),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusebalRow(title: '', value:data[index]['address']['street'].toString() ),
                                ReusebalRow(title: '', value:data[index]['address']['city'].toString() ),
                                ReusebalRow(title: '', value:data[index]['address']['suite'].toString() ),
                                ReusebalRow(title: '', value:data[index]['address']['zipcode'].toString() ),
                                
                              ],
                            ),
                          ),
                          ReusebalRow(title: "Phone :", value:data[index]['phone'].toString()),
                          ReusebalRow(title: "Web-site :", value: data[index]['website'].toString()),
                          ReusebalRow(title: "Company :", value: data[index]['company']['name'].toString()),
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


// ignore: must_be_immutable
class ReusebalRow extends StatelessWidget {
  String title, value;
   ReusebalRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Text(value,style: const  TextStyle(fontSize: 15),)
      ],
    );
  }
}
