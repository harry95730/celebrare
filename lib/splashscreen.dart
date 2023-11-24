// ignore_for_file: use_build_context_synchronously

import 'package:Celebrare/main.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    f();
  }

  void f() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 200,
              width: 200,
              child: Image(image: AssetImage('asset/image.png'))),
          Text(
            'Celebrare',
            style: TextStyle(fontSize: 65.0, fontFamily: 'Montserrat'),
          ),
          Text(
            'Digital Invitations',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    ));
  }
}
