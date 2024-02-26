import 'package:talker_flutter/talker_flutter.dart';

class CustomTalkerObserver extends TalkerObserver {
  CustomTalkerObserver();

  @override
  void onError(TalkerError err) {
    /// Send data to your error tracking system like Sentry or backend
    super.onError(err);
  }

  @override
  void onException(TalkerException err) {
    /// Send Exception to your error tracking system like Sentry or backend
    super.onException(err);
  }

  @override
  void onLog(TalkerData log) {
    /// Send log message to Grafana or backend
    super.onLog(log);
  }
}

final _observer = CustomTalkerObserver();

final talker = Talker(observer: _observer);
