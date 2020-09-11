import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neivy/entity/post.dart';

class RegistViewModel extends ChangeNotifier {
  Post _post = Post();
  String get imagePath => _post.image.path;
  bool get hasImage => _post.image != null;

  Map<String, String> errors = {};
  bool get _hasError => errors.length > 0;

  changeImage(PickedFile image) {
    this._post.image = image;

    notifyListeners();
  }

  changePlace(String place) {
    this._post.place = place;

    notifyListeners();
  }

  changeReason(String reason) {
    this._post.reason = reason;

    notifyListeners();
  }

  regist() {}
}
