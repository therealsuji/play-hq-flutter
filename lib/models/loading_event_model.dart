class LoadingEvent {
  final bool isLoading;
  final bool showOverLay;

  LoadingEvent._(this.isLoading, this.showOverLay);

  factory LoadingEvent.show({showOverLay = true}) => LoadingEvent._(true, showOverLay);
  factory LoadingEvent.hide() => LoadingEvent._(false, false);
}
