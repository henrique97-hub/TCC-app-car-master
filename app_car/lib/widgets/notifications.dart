import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createAlarmNotification(estadoAlarme) async {
  print('estado do alarme na notificação: ${estadoAlarme}');
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'alarm-channel',
      title: 'Alarm Notifications',
      body: 'O Alarme está atualmente ligado',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}

Future<void> createMovimentNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'sensor-channel',
      title: 'Presença detectada!',
      body: 'O Alarme está atualmente ligado',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}

Future<void> createAcelerometerNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'impact-channel',
      title: 'Impacto detectado!',
      body: 'Foi detectado movimento!',
      icon: 'resource://drawable/res_notification_app_icon',
    ),
  );
}
