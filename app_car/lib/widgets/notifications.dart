import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createAlarmNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'alarm_notifications',
      title: 'Alarme Ativado!',
      body: 'O Alarme está atualmente ligado',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}

Future<void> createMovimentNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'alarm_notifications',
      title: 'Alarme Ativado!',
      body: 'O Alarme está atualmente ligado',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}

Future<void> createAcelerometerNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'alarm_notifications',
      title: 'Alarme Ativado!',
      body: 'Foi detectado movimento!',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}