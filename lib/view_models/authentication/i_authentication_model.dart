import 'package:event_bus/event_bus.dart';

import '../../helpers/app_enums.dart';
import '../../helpers/app_strings.dart';
import '../../models/loading_event_model.dart';
import '../../injection_container.dart';
import '../../services/auth_service.dart';
import '../../services/nav_service.dart';
import 'authentication_model.dart';

class IAuthenticationModel extends AuthenticationModel {
  @override
  void socialLogin(SocialLogin socialLogin) async {
    sl<EventBus>().fire(LoadingEvent.show());
    var isSetupDone = await sl<AuthService>().socialLogin(socialLogin);
    sl<EventBus>().fire(LoadingEvent.hide());
    if (isSetupDone == true) {
      sl<NavigationService>().pushReplacement(MAIN_SCREEN);
    } else if (isSetupDone == false) {
      sl<NavigationService>().pushReplacement(MAIN_ONBOARDING);
    } else {
      // TODO: show error
    }
  }
}
