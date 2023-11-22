import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wasally/core/services/notification/notification_services.dart';

class OneSignalService extends Notification {
  static void initOneSignal() {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId('d3c7d9c5-9e70-48f0-891e-9d13208e8cba');
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      // ignore: avoid_print
      print('Accepted Permession $accepted');
    });
  }

  @override
  pushNotification() {}
}
