class LoadingEvent {
  final bool isLoading;

  LoadingEvent._(this.isLoading);

  factory LoadingEvent.show() => LoadingEvent._(true);
  factory LoadingEvent.hide() => LoadingEvent._(false);
}
