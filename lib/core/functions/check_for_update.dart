import 'package:in_app_update/in_app_update.dart';

Future<void> checkForUpdate() async {
  try {
    final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailability == UpdateAvailability.updateAvailable) {
      await InAppUpdate.startFlexibleUpdate();
    }
  } catch (e) {
    // ignore: avoid_print
    print('Error checking for update: $e');
  }
}
