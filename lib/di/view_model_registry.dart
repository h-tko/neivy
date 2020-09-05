import 'package:neivy/di/model_registry.dart';
import 'package:neivy/view_model/home_view_model.dart';
import 'package:neivy/view_model/launch_view_model.dart';
import 'package:neivy/view_model/regist_view_model.dart';

class ViewModelRegistry {
  static LaunchViewModel makeLaunchViewModel() {
    return LaunchViewModel();
  }

  static HomeViewModel makeHomeViewModel() {
    return HomeViewModel(ModelRegistry.makeImageModel());
  }

  static RegistViewModel makeRegistViewModel() {
    return RegistViewModel();
  }
}
