import 'package:cognifeed_app/profile/bloc/uploadImage_bloc.dart';
import 'package:cognifeed_app/profile/bloc/uploadImage_event.dart';
import 'package:cognifeed_app/profile/bloc/uploadImage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ModifyImage extends StatefulWidget {
  @override
  _ModifyImageState createState() => _ModifyImageState();
}

class _ModifyImageState extends State<ModifyImage> {
  UploadBloc uploadBloc = UploadBloc();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    var result = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      croppedFile.path,
      quality: 88,
    );
    setState(() {
      _image = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Upload/Change Profile',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 0.03 * width,
            ),
            Image.asset(
              'assets/images/avatar.png',
              width: 0.07 * width,
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  height: width * 0.65,
                  width: width * 0.65,
                  child: _image == null
                      ? GestureDetector(
                          onTap: getImage,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/photo.png',
                                width: 90,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Select an Image',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body2
                                      .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              BlocBuilder(
                bloc: uploadBloc,
                builder: (BuildContext context, state) {
                  if (state is UploadInitialState) {
                    return Container(
                      height: 50,
                      width: 50,
                    );
                  } else if (state is UploadSendingState) {
                    return Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.pink,
                      ),
                    );
                  } else if (state is UploadSuccessState) {
                    Fluttertoast.showToast(
                        msg: state.message,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    imageCache.clear();
                    Navigator.of(context).pop();
                    return Container(
                      height: 50,
                      width: 50,
                    );
                  } else if (state is UploadFailedState) {
                    Fluttertoast.showToast(
                        msg: state.error,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return Container(
                      height: 50,
                      width: 50,
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.blue[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 3,
                  ),
                  child: Image.asset(
                    'assets/images/upload.png',
                    color: Colors.green[800],
                    height: 40,
                  ),
                ),
                onPressed: () {
                  uploadBloc.add(
                    UploadProfilePicture(uploadImage: _image),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
