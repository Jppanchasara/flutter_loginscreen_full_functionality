import 'package:flutter/material.dart';
import 'package:loginscreen/HomeScreen.dart';
import 'package:loginscreen/loginScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Zenzzen",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: const HomeScreen(),
        drawer: Drawer(
            child: ListView(children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
              accountName: Text(
                "Panchasara Jayesh",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "panchasarajayesh26@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              )),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout_outlined),
            title: const Text('logOut'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.phone),
            title: const Text('+91 8980659780 '),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.email_outlined),
            title: const Text('abc@gmail.com'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.lock_open_outlined),
            title: const Text('*******'),
          ),
          const SizedBox(
            height: 200,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      //border: Border.all(width: 3, color: Colors.purple),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.login_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ]),
                ),
              ))
        ])));
  }
}
