import 'package:event_bus/event_bus.dart';

import '../models/loading_event_model.dart';
import '../injection_container.dart';

class AppLoader {
  final eventBus = sl<EventBus>();
  bool _initialDataLoaded = false;

  void loadingData({showOverlay = false}) {
    if (!_initialDataLoaded) {
      eventBus.fire(LoadingEvent.show(showOverLay: showOverlay));
    }
  }

  void skeletonDataLoading(){
    _initialDataLoaded = false;
  }

  void skeletonDataLoaded(){
    _initialDataLoaded = true;
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
