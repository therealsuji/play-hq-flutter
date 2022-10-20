import 'dart:async';

import 'package:event_bus/event_bus.dart';

import '../../models/loading_event_model.dart';
import '../../injection_container.dart';
import 'loading_overlay_model.dart';

class ILoadingOverlay extends LoadingOverlayModel {
  late StreamSubscription _loadingEvent;
  bool _loading = false;

  ILoadingOverlay() {
    _loadingEvent = sl<EventBus>().on<LoadingEvent>().listen((event) {
      _loading = event.isLoading && event.showOverLay;
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
