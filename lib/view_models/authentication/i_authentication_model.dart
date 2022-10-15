import 'package:event_bus/event_bus.dart';
import 'package:play_hq/helpers/app_enums.dart';
import 'package:play_hq/helpers/app_strings.dart';
import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/services/auth_service.dart';
import 'package:play_hq/services/nav_service.dart';
import 'package:play_hq/view_models/authentication/authentication_model.dart';

import '../../service_locator.dart';

class IAuthenticationModel extends AuthenticationModel {
  @override
  void socialLogin(SocialLogin socialLogin) async {
    locator<EventBus>().fire(LoadingEvent.show());
    var isSetupDone = await locator<AuthService>().socialLogin(socialLogin);
    locator<EventBus>().fire(LoadingEvent.hide());

    if (isSetupDone == true) {
      locator<NavigationService>().pushReplacement(MAIN_SCREEN);
    } else if (isSetupDone == false) {
      locator<NavigationService>().pushReplacement(MAIN_ONBOARDING);
    } else {
      // TODO: show error
    }
  }
}
