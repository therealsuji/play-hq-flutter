import 'dart:ffi';

import 'package:play_hq/models/loading_event_model.dart';
import 'package:play_hq/service_locator.dart';
import 'package:event_bus/event_bus.dart';

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
