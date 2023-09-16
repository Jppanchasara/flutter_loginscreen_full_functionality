

import 'package:flutter/material.dart';
import 'package:loginscreen/Getapi/Example1.dart';
import 'package:loginscreen/Getapi/Example2.dart';
import 'package:loginscreen/Getapi/Example4.dart';
import 'package:loginscreen/Getapi/Example5.dart';
import 'package:loginscreen/Getapi/Example6.dart';
import 'package:loginscreen/Getapi/Example7.dart';
import 'package:loginscreen/Getapi/Exmaple3.dart';
import 'package:loginscreen/PostApi/PostExampleOne.dart';
import 'package:loginscreen/PostApi/PostExampleTwo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: ListView(
           children:[Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ReusableWidget(
                  name: "G",
                  title: 'Example One',
                  subTitle:
                      'Example one where we create model using Plugin,click to see the source code',
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PostApi()));
                  }),
              ReusableWidget(
                  name: "G",
                  title: 'Example Two',
                  subTitle: 'Example one where we create our own custom model',
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Example2()));
                  }),
              ReusableWidget(
                  name: "G",
                  title: 'Example Three',
                  subTitle:
                      'Example four with complex JSON but we used plugins to create model and parse JSON data.',
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExampleThree()));
                  }),
              ReusableWidget(
                  name: "G",
                  title: 'Example Four',
                  subTitle:
                      "Example four where we don't used model to fetch data from server and show in our api. Then we will use this method to fetch api.",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExampleFour()));
                  }),
              ReusableWidget(
                  name: "G",
                  title: 'Example Five',
                  subTitle: "Example five, how to parse very complex JSON and show in api",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const ExampleSeven()));
                  }),
              ReusableWidget(
                  name: "G",
                  title: 'Example Six',
                  subTitle: "User list",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ExampleSixUser()));
                  }),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              ReusableWidget(
                  name: "P",
                  title: 'Example One POST Api: Register',
                  subTitle: "Ligin & signup with rest Api",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PostExampleOne()));
                  }),
              ReusableWidget(
                  name: "P",
                  title: 'Example Two POST Api: Login',
                  subTitle: "Ligin & signup with rest Api",
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const PostExampleTwo()));
                  }),
            ],
          ),]
        ),
        );
  }
}

class ExampleOne extends StatelessWidget {
  const ExampleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExampleFive();
  }
}

// ignore: must_be_immutable
class ReusableWidget extends StatelessWidget {
  late String title, subTitle, name;
  final VoidCallback onPress;

  ReusableWidget(
      {Key? key,
      required this.name,
      required this.title,
      required this.subTitle,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.red,
            child: Text(
              name,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
