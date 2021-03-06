import 'package:flutter/material.dart';
import 'package:neivy/config/colors.dart';
import 'package:neivy/di/view_model_registry.dart';
import 'package:neivy/ui/components/clipped_image.dart';
import 'package:neivy/ui/regist/regist_screen.dart';
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 40.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: ClippedImage.build(_buildMainImage(context)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: successColor,
                    ),
                    child: IconButton(
                      iconSize: 40.0,
                      color: Colors.brown,
                      icon: Icon(Icons.create_outlined),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(
                              create: (_) =>
                                  ViewModelRegistry.makeRegistViewModel(),
                              child: RegistScreen(),
                            ),
                            fullscreenDialog: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
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
