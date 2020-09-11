import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neivy/config/colors.dart';
import 'package:neivy/view_model/regist_view_model.dart';
import 'package:provider/provider.dart';

class RegistScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RegistViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildImageArea(context),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: '撮影した場所',
                    errorText: vm.errors['place'],
                  ),
                  validator: (value) => value.isEmpty ? '必須です' : null,
                  autovalidateMode: AutovalidateMode.disabled,
                  onChanged: (value) => vm.changePlace(value),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'おすすめポイント',
                    errorText: vm.errors['reason'],
                  ),
                  onChanged: (value) => vm.changeReason(value),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 20.0),
                  RaisedButton(
                    child: Text("投稿"),
                    color: successColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {
                      // バリデーション実行
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      vm.regist();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview(BuildContext context) {
    final vm = Provider.of<RegistViewModel>(context);

    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(vm.imagePath),
    );
  }

  Widget _buildImageArea(BuildContext context) {
    final vm = Provider.of<RegistViewModel>(context);
    var form;

    // 画像の有無で表示する内容を切り替える
    if (vm.hasImage) {
      form = _buildImagePreview(context);
    } else {
      form = _buildImageSelector(context);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: InkWell(
        onTap: () {
          final picker = ImagePicker();
          picker
              .getImage(source: ImageSource.gallery)
              .then((value) => vm.changeImage(value));
        },
        child: form,
      ),
    );
  }

  Widget _buildImageSelector(BuildContext context) {
    return Container(
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
    );
  }
}
