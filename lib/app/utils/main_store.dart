
import 'package:event_bus/event_bus.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'default_events.dart';
import 'event_info.dart';

class MainStore<T extends Object> extends Store<T> {
  final EventBus? eventBus;
  final T initialValue;

  MainStore(
    this.eventBus,
    this.initialValue,
  ) : super(initialValue);

  showSuccessMessage(String message) {
    eventBus?.fire(
      EventInfo(name: DefaultEvents.showSuccessMessageEvent, data: message),
    );
  }

  showErrorMessage(String message) {
    eventBus?.fire(
      EventInfo(name: DefaultEvents.showErrorMessageEvent, data: message),
    );
  }

  showAppLoader(bool show) {
    final event = show
        ? DefaultEvents.showAppLoaderEvent
        : DefaultEvents.hideAppLoaderEvent;
    eventBus?.fire(EventInfo(name: event));
  }
}
