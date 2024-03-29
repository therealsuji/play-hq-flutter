import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/service_locator.dart';
import 'package:play_hq/models/loading_event_model.dart';

import 'loading_overlay_model.dart';

class ILoadingOverlay extends LoadingOverlayModel {
  late StreamSubscription _loadingEvent;
  bool _loading = false;

  ILoadingOverlay() {
    _loadingEvent = locator<EventBus>().on<LoadingEvent>().listen((event) {
      _loading = event.isLoading;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _loadingEvent.cancel();
    super.dispose();
  }

  @override
  bool get isLoading => _loading;
}
