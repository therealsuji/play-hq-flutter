import 'package:event_bus/event_bus.dart';

import '../models/loading_event_model.dart';
import '../service_locator.dart';

class AppLoader {
  final eventBus = locator<EventBus>();
  bool _initialDataLoaded = false;

  void loadingData({showOverlay = false}) {
    if (!_initialDataLoaded) {
      eventBus.fire(LoadingEvent.show(showOverLay: showOverlay));
    }
  }

  void dataLoaded() {
    if (!_initialDataLoaded) {
      hideLoader();
    }
    _initialDataLoaded = true;
  }

  void hideLoader() {
    eventBus.fire(LoadingEvent.hide());
  }

  bool get hasInitialDataLoaded => _initialDataLoaded;
}
