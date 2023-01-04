import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Detail(),
    ),
  );
}

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  bool val = false;
  bool switchval = false;



  @override
  Widget build(BuildContext context) {
    Map <String, dynamic> A1 = ModalRoute.of(context)!.settings.arguments as Map <String , dynamic> ;
    makecall(String? number) async {
      final Uri call = Uri(
        scheme: 'tel',
        path: number,
      );
      await launchUrl(call);
    }
    makesms(String? number) async {
      final Uri sms = Uri(
        scheme: 'sms',
        path: number,
      );
      await launchUrl(sms);
    }

    makeEmail() async {
      final Uri email = Uri(
        scheme: 'mailto',
        path: '${"arshitvadsak@gmail.com"}',
      );
      await launchUrl(email);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Row(
            children: [
              const Text(
                "Contacts",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(width: 100),
              Transform.scale(
                scale: 1.7,
                child: Switch(
                  value: switchval,
                  onChanged: (onChanged) {
                    setState(() {
                      switchval = onChanged;
                    });
                  },
                  activeColor: Colors.black,
                  //inactiveTrackColor: Colors.green,
                  inactiveThumbImage:
                      const AssetImage("assets/images/light.jpg"),
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
          elevation: 0,
          backgroundColor: switchval ? Colors.brown : Colors.teal,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 120),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage("assets/images/person.png"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.content_paste_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child:Text(
                "${A1['name']}",
                // "${A1.firstname} ${A1.lastname}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "${A1['number']}",
                // "+91 ${A1.phonenumber} ",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.black87,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    makecall(A1['number']);
                  },
                  mini: true,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.call),
                ),
                FloatingActionButton(
                  onPressed: () {
                    makesms(A1['number']);
                  },
                  mini: true,
                  backgroundColor: Colors.amberAccent,
                  child: const Icon(Icons.message),
                ),
                FloatingActionButton(
                  onPressed: () {
                    makeEmail();
                  },
                  mini: true,
                  backgroundColor: Colors.lightBlue,
                  child: const Icon(Icons.email_outlined),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    // await Share.share(
                    //     "Name:${h1.firstname} ${h1.lastname}\n+91 ${h1.phonenumber}");
                  },
                  mini: true,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: const Icon(Icons.share),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
