
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginscreen/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  bool changeButton = false;
  bool passwordSeen = true;
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

 void login(BuildContext context) async {
    if (_formKey.currentState!.validate() && check) {
      setState(() {
        changeButton = !changeButton;
      });
      
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      setState(() {
        changeButton = !changeButton;
      }); 

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello again!👋',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                        hintText: "Email",
                        fillColor: const Color.fromARGB(255, 241, 247, 252),
                        filled: true,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              email.clear();
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.red.shade700,
                              width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password canot be empty";
                      } else if (value.length < 6) {
                        return "password length should atleast 6";
                      }
                      return null;
                    },
                    obscureText: passwordSeen,
                    obscuringCharacter: '*',
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    decoration: InputDecoration(
                        hintText: "Password",
                      
                        fillColor:const Color.fromARGB(255, 241, 247, 252),
                        filled: true,
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
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.red.shade700,
                              width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.grey.shade200))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  
                  
                 Row(
                      children: [
                        Checkbox(
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.red.withOpacity(.32);
                              }
                              return Colors.grey;
                            }),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            value: check,
                            onChanged: (value) {
                              setState(() {
                                check = !check;
                              });
                            }),
                        const Text(
                          "I agree to the ",
                          style: TextStyle(fontSize: 15, color: Colors.black,),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text("Panama Tearms ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                      borderRadius: changeButton
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(10),
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          login(context);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 400,
                          child: Center(
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,fontWeight: FontWeight.bold
                                        ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    
                    children: [
                      
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey.shade500),
                                ),
                              ),
                      ),
                      Text("  OR  ",style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey.shade500),
                                ),
                              ),
                      ),

                      
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500])),
                        InkWell(
                            onTap: () {},
                            child: Text("REGISTER",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
