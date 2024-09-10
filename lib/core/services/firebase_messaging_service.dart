import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_keys.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/services/caching_service.dart';
import 'package:real_state/core/services/router_service.dart';
import 'package:real_state/injection_container.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  Logger().i(
    '''Start `handleBackgroundMessage of vm:entry-point` |FirebaseMessagingService| 
            Notification title: ${message.notification?.title}
            Notification body: ${message.notification?.body}
            Message data: ${message.data}
      ''',
  );
}

class FirebaseMessagingService {
  RemoteMessage? localMessage;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final CacheService cacheService;

  FirebaseMessagingService({required this.cacheService});

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for Important notifications',
    importance: Importance.max,
  );

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotificationsSettings() async {
    InjectionContainer.getIt<Logger>().i('Start `initNotificationsSettings` |FirebaseMessagingService|');
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await initForegroundNotifications();
    await initBackgroundNotifications();
    InjectionContainer.getIt<Logger>().w(
      'End `initNotificationsSettings` |FirebaseMessagingService|',
    );
  }

  Future<String?> getToken() async {
    String? token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      cacheService.setData(key: AppKeys.deviceToken, value: token);
      return token;
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        'End `getToken` |FirebaseMessagingService| Exception: `$e`',
      );
    }
    return null;
  }

  Future<void> deleteToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      cacheService.setData(key: AppKeys.deviceToken, value: null);
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        'End `deleteToken` |FirebaseMessagingService| Exception: `$e`',
      );
    }
  }

  Future<void> subscribeToTopic() async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic('admin');
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        'End `subscribeToTopic` |FirebaseMessagingService| Exception: `$e`',
      );
    }
  }

  Future<void> unsubscribeFromTopic() async {
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic('admin');
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        'End `unsubscribeFromTopic` |FirebaseMessagingService| Exception: `$e`',
      );
    }
  }

  Future<void> initForegroundNotifications() async {
    InjectionContainer.getIt<Logger>().i('Start `initForegroundNotifications` |FirebaseMessagingService|');
    // LocalNotifications Settings
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    /// this callback will call when receive foreground notification
    FirebaseMessaging.onMessage.listen(onReceiveForegroundMessage);

    /// this callback will call when click on received foreground notification
    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onClickForegroundMessage,
    );
    InjectionContainer.getIt<Logger>().w('End `initForegroundNotifications` |FirebaseMessagingService|');
  }

  Future<void> initBackgroundNotifications() async {
    InjectionContainer.getIt<Logger>().i('Start `initBackgroundNotifications` |FirebaseMessagingService|');

    /// this callback will call when start app
    _firebaseMessaging.getInitialMessage().then(onGetInitialMessagesWhenStartApp);

    /// this callback will call when click on received background notification
    FirebaseMessaging.onMessageOpenedApp.listen(onClickBackgroundMessage);

    /// this callback will call when receive background notification
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    InjectionContainer.getIt<Logger>().w('End `initBackgroundNotifications` |FirebaseMessagingService|');
  }

  Future<void> onReceiveForegroundMessage(RemoteMessage message) async {
    InjectionContainer.getIt<Logger>().i(
      '''Start `onReceiveForegroundMessage` |FirebaseMessagingService| 
            Notification title: ${message.notification?.title}
            Notification body: ${message.notification?.body}
            Message data: ${message.data}
      ''',
    );
    localMessage = message;
    if (localMessage?.notification == null) return;

    if (message.data['type'] == 'accept_user') {
      InjectionContainer.getIt<RouterService>().router.go(
            AppRoutes.mainScreen,
          );
    }
    if (message.data['type'] == 'reject_user') {
      // InjectionContainer.getIt<RouterService>().router.go(
      //   AppRoutes.verifyIdentityScreen,
      // );
    }
    _flutterLocalNotificationsPlugin.show(
      localMessage.hashCode,
      localMessage?.notification?.title,
      localMessage?.notification?.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@drawable/launcher_icon',
        ),
      ),
    );
    InjectionContainer.getIt<Logger>().w('End `onReceiveForegroundMessage` |FirebaseMessagingService|');
  }

  Future<void> onClickForegroundMessage(NotificationResponse? notificationResponse) async {
    InjectionContainer.getIt<Logger>().i(
      '''Start `onClickForegroundMessage` |FirebaseMessagingService| 
            Notification title: ${localMessage?.notification?.title}
            Notification body: ${localMessage?.notification?.body}
            Message data: ${localMessage?.data}
      ''',
    );
    if (localMessage != null) {
      await clearLocalNotifications(localMessage!);
    }
    if (localMessage != null) {
      redirect(localMessage!);
    }
    InjectionContainer.getIt<Logger>().w('End `onClickForegroundMessage` |FirebaseMessagingService|');
  }

  Future<void> onClickBackgroundMessage(RemoteMessage message) async {
    InjectionContainer.getIt<Logger>().i(
      '''Start `onClickBackgroundMessage` |FirebaseMessagingService| 
            Notification title: ${message.notification?.title}
            Notification body: ${message.notification?.body}
            Message data: ${message.data}
      ''',
    );
    await clearLocalNotifications(message);
    redirect(message);
    InjectionContainer.getIt<Logger>().w('End `onClickBackgroundMessage` |FirebaseMessagingService|`');
  }

  Future<void> onGetInitialMessagesWhenStartApp(RemoteMessage? message) async {
    InjectionContainer.getIt<Logger>().i(
      '''Start `onGetInitialMessagesWhenStartApp` |FirebaseMessagingService| 
            Notification title: ${message?.notification?.title}
            Notification body: ${message?.notification?.body}
            Message data: ${message?.data}
      ''',
    );
    if (message == null) {
      InjectionContainer.getIt<Logger>().w(
        'End `onGetInitialMessagesWhenStartApp` |FirebaseMessagingService|` message: `$message`',
      );
      return;
    }
    await clearLocalNotifications(message);
    InjectionContainer.getIt<Logger>().w(
      'End `onGetInitialMessagesWhenStartApp` |FirebaseMessagingService|` message: `$message`',
    );
  }

  void redirect(RemoteMessage message) {
    if (message.data.containsKey('type')) {
      if (message.data['type'] == 'message') {
        InjectionContainer.getIt<RouterService>().router.push(
              AppRoutes.mainScreen,
              extra: 1,
            );
        return;
      }
      if (message.data['type'] == 'accept_user') {
        InjectionContainer.getIt<RouterService>().router.go(
              AppRoutes.mainScreen,
            );
        return;
      }
      if (message.data['type'] == 'reject_user') {
        // InjectionContainer.getIt<RouterService>().router.go(
        //       AppRoutes.verifyIdentityScreen,
        //     );
        return;
      }
    }
    if (message.data.containsKey('requestHashId')) {
      // InjectionContainer.getIt<RouterService>().router.push(
      //       AppRoutes.notificationPendingTransactionDetailsScreen,
      //       extra: message.data['requestHashId'],
      //     );
      return;
    }
    InjectionContainer.getIt<RouterService>().router.push(
          AppRoutes.mainScreen,
        );
  }

  Future<void> clearLocalNotifications(RemoteMessage message) async {
    InjectionContainer.getIt<Logger>().i('Start `clearLocalNotifications` |FirebaseMessagingService|');
    await _flutterLocalNotificationsPlugin.cancel(message.hashCode);
    InjectionContainer.getIt<Logger>().w('End `clearLocalNotifications` |FirebaseMessagingService|');
  }
}
