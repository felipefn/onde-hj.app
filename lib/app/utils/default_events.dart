import 'package:event_bus/event_bus.dart';

import 'event_info.dart';

class DefaultEvents {
  static const showSuccessMessageEvent = 'show_success_message';
  static const showErrorMessageEvent = 'show_error_message';
  static const showAppLoaderEvent = 'show_app_loader';
  static const hideAppLoaderEvent = 'hide_app_loader';
  static const openLinkEvent = 'open_link';
  static const changeLanguage = 'change_language';
}

extension EventBusExtension on EventBus {
  showAppLoader(bool show) {
    final event = show
        ? DefaultEvents.showAppLoaderEvent
        : DefaultEvents.hideAppLoaderEvent;
    fire(EventInfo(name: event));
  }

  showSuccessMessage(String message) {
    print("success");
    const event = DefaultEvents.showSuccessMessageEvent;
    fire(EventInfo(name: event, data: message));
  }

  showErrorMessage(String message) {
    const event = DefaultEvents.showErrorMessageEvent;
    fire(EventInfo(name: event, data: message));
  }

  openLink(String url) {
    const event = DefaultEvents.openLinkEvent;
    fire(EventInfo(name: event, data: url));
  }
}
