import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistViewModel extends ChangeNotifier {
  PickedFile _image;
  String get imagePath => _image.path;
  bool get hasImage => _image != null;

  Map<String, String> errors;
  bool get hasError => errors.length > 0;

  String _place = '';
  String _reason = '';

  changeImage(PickedFile image) {
    this._image = image;

    notifyListeners();
  }

  changePlace(String place) {
    this._place = place;

    notifyListeners();
  }

  changeReason(String reason) {
    this._reason = reason;

    notifyListeners();
  }

  validate() {
    // 必須
    if (this._place.length < 1) {
      errors['place'] = '撮影場所を入力してください。';
    }

    if (this._image == null) {
      errors['image'] = '画像を選んでください。';
    }
  }
}
