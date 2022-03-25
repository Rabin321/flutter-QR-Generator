import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    var qrImage = QrImage(
      data: data,
      backgroundColor: Colors.white,
      version: QrVersions.auto,
      size: 300.0,
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRect(
                child: Center(
                  child: qrImage,
                  heightFactor: 1.0,
                ),
              ),

              const SizedBox(
                height: 20.0,
              ), //space between qr and text
              // ignore: sized_box_for_whitespace

              Container(
                width: 300.0,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Enter your data here',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 178, 182, 194),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 40.0,
              ),
              RawMaterialButton(
                onPressed: () {},
                fillColor: const Color.fromARGB(255, 194, 210, 218),
                child: const Text(
                  "Save QR Code",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),

              RawMaterialButton(
                onPressed: () {
                  Share.share(qrImage.toString());
                },
                fillColor: const Color.fromARGB(255, 194, 210, 218),
                child: const Text(
                  "Share QR Code",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 37.0,
                  vertical: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
