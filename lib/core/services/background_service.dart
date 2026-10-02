import 'dart:async';
import 'dart:developer';

import 'package:flutter_background_service/flutter_background_service.dart';

class BackgroundService {

  Future<void> initialise() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
        autoStart: false,
        notificationChannelId: 'loction_channel',
        initialNotificationTitle: 'Locution Service',
        initialNotificationContent: 'Loctionss ....',
        foregroundServiceNotificationId: 1001,
      ),
      iosConfiguration: IosConfiguration(
        onForeground: onStart,
        autoStart: false,
      ),
    );
  }

  static Future<void> start() async {
    final service = FlutterBackgroundService();

    await service.startService();
  }

  @pragma('vm:entry-point')
  static Future<bool> onStart(ServiceInstance service) async {

    /// ===>>> 5-min tigger
    Timer.periodic(
      const Duration(minutes: 5),
      (timer) async {
        log('5 min done >>>>');

      },
    );

    return true;
  }
}