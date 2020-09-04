import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageModel {
  static final String _path = 'assets/images/';
  static final String _imageDir = 'images';
  static final String _postDir = 'posts';
  static final String _uploadPath = 'images/upload/';

  String get randomFileName {
    var rnd = Random();
    return "${rnd.nextInt(2) + 1}.jpg";
  }

  String buildName({@required String name}) {
    var path = _path;

    if (Platform.isIOS) {
      path += "ios/";
    } else {
      path += "android/";
    }

    return path + name;
  }

  Future<String> uploadImage(File file) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    var ref = FirebaseStorage().ref().child(_uploadPath).child('$timestamp');
    var uploadTask = ref.putFile(file);
    var snapshot = await uploadTask.onComplete;

    if (snapshot.error == null) {
      return await snapshot.ref.getDownloadURL();
    } else {
      return null;
    }
  }

  Future<String> getImageURL() async {
    final StorageReference ref =
        FirebaseStorage.instance.ref().child(_imageDir).child(_postDir);

    return await ref.child(randomFileName).getDownloadURL();
  }
}
