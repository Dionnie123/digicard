import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/services/user_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<RouterService>();
  final _userService = locator<UserService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    if (_userService.userId != null) {
      await _navigationService.clearStackAndShow(
        const HomeViewRoute(),
      );
    } else {
      await _navigationService.clearStackAndShow(
        const AuthViewRoute(),
      );
    }
    FlutterNativeSplash.remove();
  }
}
