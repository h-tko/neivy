import 'package:flutter/material.dart';
import 'package:neivy/view_model/launch_view_model.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<LaunchViewModel>(context);

    // 初期データ取得が終わるまでくるくるしておく
    if (vm.isFinishedFetching) {
      Future.delayed(Duration.zero).then((_) => _next(context));
    } else {
      // fetch data
    }

    return Scaffold(
      body: Container(
        child: LayoutBuilder(builder: (_, constraints) {
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }

  _next(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
