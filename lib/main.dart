// ignore_for_file: use_build_context_synchronously

import 'package:Celebrare/croping.dart';
import 'package:Celebrare/dialoguebox.dart';
import 'package:Celebrare/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: Splashscreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ImagePicker _imagePicker;
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _imagePath = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        centerTitle: true,
        elevation: 1,
        title: const Text('Add Image /Icon'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54, width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: Text("Upload Image"),
                )),
                subtitle: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      XFile? pickedFile = await _imagePicker.pickImage(
                          source: ImageSource.gallery);

                      if (pickedFile != null) {
                        bool result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(imagePath: pickedFile.path)));

                        setState(() {});
                        if (result && imga1 != null) {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return MyDialog(img: imga1!);
                            },
                          );
                          setState(() {});
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade600,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    child: const Text(
                      'Choose from Device',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ImageOverlayExample(
            imagepath: _imagePath,
          ),
        ],
      ),
    );
  }
}

class ImageOverlayExample extends StatefulWidget {
  final String imagepath;
  const ImageOverlayExample({Key? key, required this.imagepath})
      : super(key: key);

  @override
  State<ImageOverlayExample> createState() => _ImageOverlayExampleState();
}

class _ImageOverlayExampleState extends State<ImageOverlayExample> {
  @override
  Widget build(BuildContext context) {
    return imga != null
        ? Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: imga!.image, fit: BoxFit.fill)),
            child: backimg1.isNotEmpty
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcOut,
                    ),
                    child: Image.asset(
                      backimg1,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(
                    height: 400,
                    child: Image(
                      image: imga!.image,
                      fit: BoxFit.fill,
                    )),
          )
        : Container();
  }
}
