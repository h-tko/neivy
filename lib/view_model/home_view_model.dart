import 'package:flutter/cupertino.dart';
import 'package:neivy/model/image_model.dart';

class HomeViewModel extends ChangeNotifier {
  ImageModel _imageModel;

  static final String _defaultMVName = "top_temp_image.jpg";

  String _currentImageName;

  bool get isSyncedImageName => _currentImageName != null;

  HomeViewModel(this._imageModel) {
    this._imageModel.getImageURL().then((value) {
      this._currentImageName = value;
      notifyListeners();
    });
  }

  String getMainViewName() {
    if (this._currentImageName == null) {
      return this._imageModel.buildName(name: _defaultMVName);
    } else {
      return this._currentImageName;
    }
  }
}
