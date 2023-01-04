import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: slider(),
    ),
  );
}

class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  double SliderValue = 0;
  bool switchval = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Row(
            children: [
              const Text(
                "Slider",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(width: 130),
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
          backgroundColor: switchval ? Colors.brown : Colors.teal,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              SliderValue.toString(),
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Slider(
              value: SliderValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: SliderValue.toString(),
              activeColor: switchval ? Colors.brown : Colors.teal,
              onChanged: (value) {
                setState(() {
                  SliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
