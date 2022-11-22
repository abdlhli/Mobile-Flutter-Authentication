// ignore_for_file: avoid_print, prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_ujikom/loginscreen.dart';
import 'package:tugas_ujikom/lokasi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.extension),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(height: 37),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Welcome, \n",
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  TextSpan(
                    text: auth.currentUser!.email,
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ],
              ),
              style: const TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search"),
            ),
            SizedBox(height: 10),
            Container(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Lokasi(),
                    ),
                  );
                },
                icon: Icon(Icons.map_sharp),
                label: Text("Mencari Lokasi Saat Ini"),
              ),
            ),
            Container(
              child: ElevatedButton.icon(
                onPressed: () {
                  _signOut().then(
                    (value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.logout_outlined),
                label: Text('Logout'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
