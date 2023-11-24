// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

Image? imga;
Image? imga1;

class MyHomePage extends StatefulWidget {
  final String imagePath;

  const MyHomePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String backimg = '';
  bool x = false;
  bool y = false;
  final controller = CropController(
    aspectRatio: null,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: Colors.black87,
          actions: [
            _buildButtons(),
          ]),
      body: Container(
        color: Colors.black,
        child: Transform.flip(
          flipX: x,
          flipY: y,
          child: CropImage(
            controller: controller,
            image: Image.file(File(widget.imagePath), fit: BoxFit.cover),
            paddingSize: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.aspect_ratio,
              color: Colors.white,
            ),
            onPressed: _aspectRatios,
          ),
          IconButton(
            icon: const Icon(
              Icons.rotate_90_degrees_ccw_outlined,
              color: Colors.white,
            ),
            onPressed: _rotateLeft,
          ),
          Transform.flip(
            flipX: x,
            child: IconButton(
              icon: const Icon(
                Icons.flip_sharp,
                color: Colors.white,
              ),
              onPressed: _flipleft,
            ),
          ),
          Transform.flip(
            flipY: y,
            child: IconButton(
              icon: Transform.rotate(
                angle: 90 * 3.141592653589793 / 180,
                child: const Icon(
                  Icons.flip,
                  color: Colors.white,
                ),
              ),
              onPressed: _fliptop,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.rotate_90_degrees_cw_outlined,
              color: Colors.white,
            ),
            onPressed: _rotateRight,
          ),
          TextButton(
            onPressed: () {
              _finished();
            },
            child: const Text(
              'Crop',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  Future<void> _aspectRatios() async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select aspect ratio'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, -1.0),
              child: const Text('free'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1.0),
              child: const Text('square'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 2.0),
              child: const Text('2:1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1 / 2),
              child: const Text('1:2'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 4.0 / 3.0),
              child: const Text('4:3'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 16.0 / 9.0),
              child: const Text('16:9'),
            ),
          ],
        );
      },
    );
    if (value != null) {
      controller.aspectRatio = value == -1 ? null : value;
      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
    }
  }

  Future<void> _flipleft() async {
    setState(() {
      x = !x;
    });
  }

  Future<void> _fliptop() async {
    setState(() {
      y = !y;
    });
  }

  Future<void> _rotateLeft() async => controller.rotateLeft();

  Future<void> _rotateRight() async => controller.rotateRight();

  Future<void> _finished() async {
    final image = await controller.croppedImage();
    imga1 = image;
    Navigator.pop(context, true);
  }
}
