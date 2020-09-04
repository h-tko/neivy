import 'package:flutter/material.dart';
import 'package:neivy/ui/components/cliped_image.dart';
import 'package:neivy/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LayoutBuilder(builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: _buildBody(context),
          );
        }),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: ClipedImage.build(_buildMainImage(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildMainImage(BuildContext context) {
    var vm = Provider.of<HomeViewModel>(context);

    if (vm.isSyncedImageName) {
      return Image.network(
        vm.getMainViewName(),
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        vm.getMainViewName(),
        fit: BoxFit.cover,
      );
    }
  }
}
