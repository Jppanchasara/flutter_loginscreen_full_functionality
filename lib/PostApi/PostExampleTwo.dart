import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:loginscreen/utill/Tomessage.dart';

class PostExampleTwo extends StatefulWidget {
  const PostExampleTwo({super.key});

  @override
  State<PostExampleTwo> createState() => _PostExampleTwoState();
}

class _PostExampleTwoState extends State<PostExampleTwo> {
  String name = "";
  bool changeButton = false;
  bool passwordSeen = true;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        // email:eve.holt@reqres.in
        //password:cityslicka
        var data = jsonDecode(response.body.toString());
        print("Account created successfuly");
        // const snackBar = SnackBar(
        //     content: Text('Account created successfuly'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Utils.ToMessage("Login successfuly");

        moveToHome(context);

        print(data);
      } else {
        Utils.ToMessage('Login Failrd');
        passwordController.clear();
        emialController.clear();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      //Navigator.pushNamed(context, MyRoutes.HomeScreenRoute);
      // setState(() {
      //   changeButton = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Post API Example One",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 3)),
                height: 150,
                width: 250,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Text(
                          "Note:\n Enter the email : eve.holt@reqres.in \n and  password: cityslicka \nLogin Scucessfuly ")),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text('Welcome ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emialController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: "Enter email",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscuringCharacter: '*',
                      obscureText: passwordSeen,
                      controller: passwordController,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordSeen = !passwordSeen;
                              });
                            },
                            child: passwordSeen
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey.shade400,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.grey.shade400,
                                  ),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: Colors.black,
                          ),
                          hintText: "Password",
                          labelText: "Enter Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 6) {
                          return 'password length should atleast 6 ';
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Material(
              color: Colors.red,
              borderRadius: changeButton
                  ? BorderRadius.circular(50)
                  : const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
              child: InkWell(
                onTap: () async {
                  // moveToHome(context);
                  login(emialController.text.toString(),
                      passwordController.text.toString());
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 50,
                  alignment: Alignment.center,
                  width: changeButton ? 50 : 150,
                  child: Center(
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
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
      ),
    );
  }
}
