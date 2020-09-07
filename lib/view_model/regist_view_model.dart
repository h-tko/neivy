import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistViewModel extends ChangeNotifier {
  PickedFile _image;
  String get imagePath => _image.path;
  bool get hasImage => _image != null;

  String _place = '';
  String _reason = '';

  changeImage(PickedFile image) {
    this._image = image;

    notifyListeners();
  }
}
