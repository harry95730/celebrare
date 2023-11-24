import 'package:Celebrare/croping.dart';
import 'package:flutter/material.dart';

String backimg = '';
String backimg1 = '';

class MyDialog extends StatefulWidget {
  final Image img;
  const MyDialog({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      elevation: 1,
      children: [
        Card(
          color: Colors.white,
          shadowColor: Colors.blueGrey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Uploaded Image',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.img.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: backimg.isNotEmpty
                            ? ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcOut,
                                ),
                                child: Image.asset(
                                  backimg,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : null,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          backimg = '';
                        });
                      },
                      child: cont(''),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          backimg = 'asset/user_image_frame_1.png';
                        });
                      },
                      child: cont('asset/user_image_frame_1.png'),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          backimg = 'asset/user_image_frame_2.png';
                        });
                      },
                      child: cont('asset/user_image_frame_2.png'),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          backimg = 'asset/user_image_frame_3.png';
                        });
                      },
                      child: cont('asset/user_image_frame_3.png'),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          backimg = 'asset/user_image_frame_4.png';
                        });
                      },
                      child: cont('asset/user_image_frame_4.png'),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      imga = widget.img;
                      backimg1 = backimg;
                    });

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Use this image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cont(String bg) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 60.0,
        width: bg.isNotEmpty ? 60.0 : null,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: bg.isNotEmpty
              ? Image.asset(
                  bg,
                  fit: BoxFit.fill,
                )
              : const Center(
                  child: Text(
                    'ORIGINAL',
                    style: TextStyle(fontSize: 8),
                    maxLines: 1,
                  ),
                ),
        ),
      ),
    );
  }
}
