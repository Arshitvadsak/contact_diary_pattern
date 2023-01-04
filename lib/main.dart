import 'package:contact_diary_pattern/SplashPage.dart';
import 'package:contact_diary_pattern/detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Slider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Splash(),
       //  'home': (context) => const home(),
        // 'homepage': (context) => const ContactApp(),
        // 'addcontact': (context) => const Edit(),
        //'detail': (context) => const Detail(),
        // 'editpage': (context) => const Contact_edit(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool switchval = false;

  makecall({required phonenumber}) async {
    final Uri call = Uri(
      scheme: 'tel',
      path: '+91 $phonenumber',
    );
    await launchUrl(call);
  }

  List<Map<String, dynamic>> allUsers = [
    {"id": 1, "name": "Arshit", "number": 9662805595},
    {"id": 2, "name": "Akash", "number": 6353363645},
    {"id": 3, "name": "Zeel", "number": 7621839795},
    {"id": 4, "name": "Harshil", "number": 9328949821},
    {"id": 5, "name": "Dharmik", "number": 9510422851},
    {"id": 6, "name": "Parth", "number": 9313433309},
    {"id": 7, "name": "Pratik", "number": 9727979960},
    {"id": 8, "name": "Kishan", "number": 9265771251},
    {"id": 9, "name": "Vivek", "number": 6356432286},
    {"id": 10, "name": "Aj thummar", "number": 9904975042},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Row(
            children: [
              const Text(
                "Contacts",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(width: 100),
              Transform.scale(
                scale: 1.5,
                child: Switch(
                  value: switchval,
                  onChanged: (onChanged) {
                    setState(() {
                      switchval = onChanged;
                    });
                  },
                  activeColor: Colors.black,
                  //inactiveTrackColor: Colors.green,
                  inactiveThumbImage: const AssetImage("assets/images/light.jpg"),
                  activeThumbImage: const AssetImage("assets/images/moon.jpg"),
                ),
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
          centerTitle: true,
          backgroundColor: switchval ? Colors.brown : Colors.teal,
          leading: Icon(Icons.menu),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: allUsers.length,
        itemBuilder: (context, i) {
          return ListTile(
            // onTap: () {
            //   makecall(phonenumber: Globals.allcontacts[i].phonenumber);
            // },
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
            title: Text(
              allUsers[i]["name"].toString(),
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              allUsers[i]["number"].toString(),
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
              onPressed: () {
               // Navigator.of(context).pushNamed('detail', arguments: allUsers);

                Map<String,dynamic> k = {
                  "name": allUsers[i]['name'],
                  "number": allUsers[i]['number'].toString(),
                };
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail(),settings: RouteSettings(arguments: k)));
              },
              icon: const Icon(
                Icons.info,
                size: 32,
              ),
              color: Colors.black,
            ),
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: switchval ? Colors.brown : Colors.teal,
              onPressed: () {
                 Navigator.of(context)
                     .push(MaterialPageRoute(builder: (context) => slider()));
              },
              child: const Icon(
                Icons.add,
                size: 27,
              )),
        ),
      ),
    );
  }
}
