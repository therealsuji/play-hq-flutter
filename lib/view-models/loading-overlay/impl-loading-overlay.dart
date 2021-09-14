import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:play_hq/service-locator.dart';
import 'package:play_hq/models/loading-event-model.dart';
import 'package:rxdart/rxdart.dart';

import 'loading-overlay-model.dart';

class ImplLoadingOverlay extends LoadingOverlayModel {
  late StreamSubscription _loadingEvent;
  bool _loading = false;

  ImplLoadingOverlay() {
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
