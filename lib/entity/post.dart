import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class Post {
  String key;
  PickedFile image;
  String imageName;
  String place;
  String reason;

  Post({this.imageName, this.place = '', this.reason = '', this.image});

  Post.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        imageName = snapshot.value["imageName"],
        place = snapshot.value["place"],
        reason = snapshot.value["message"];
}
