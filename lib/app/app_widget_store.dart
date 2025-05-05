import 'package:equatable/equatable.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'utils/components/snackbar/ondehj_snackbar_type.dart';

class AppWidgetStore extends Store<AlertInfo> {
  AppWidgetStore(
      )
      : super(AlertInfo(
          message: '',
          type: OndeHjSnackbarType.positive,
        )
  );      
}

class AlertInfo extends Equatable {
  final String message;
  final OndeHjSnackbarType type;
  late final Duration duration;

  static const wordsBySeconds = 5;

  AlertInfo({
    required this.message,
    required this.type,
  }) {
    final messageTime = ((message.split(' ').toList().length) / wordsBySeconds);
    final timeToMiliseconds = (messageTime * 1000).toInt();

    duration = Duration(milliseconds: timeToMiliseconds + 500);
  }

  @override
  List<Object?> get props => [
        message,
        type,
        duration,
      ];
}
