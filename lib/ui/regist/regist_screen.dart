import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neivy/config/colors.dart';

class RegistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildImageSelector(context),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                decoration: const InputDecoration(labelText: '撮影した場所'),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(labelText: 'おすすめポイント'),
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text("閉じる"),
                  color: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 20.0),
                RaisedButton(
                  child: Text("投稿"),
                  color: successColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSelector(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: InkWell(
        onTap: () {
          final picker = ImagePicker();
          final file = picker.getImage(source: ImageSource.gallery);
        },
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.black54,
                    size: 60.0,
                  ),
                ),
                Text(
                  '写真を載せる',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hiragino Kaku Gothic ProN',
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'あなたのお気に入りの風景を載せましょう',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hiragino Kaku Gothic ProN',
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
