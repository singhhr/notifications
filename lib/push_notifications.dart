import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.

      // For testing purposes print the Firebase Messaging token
      _firebaseMessaging.getToken().then((token) {
        print(token); // Print the Token in Console
      });
      FirebaseMessaging.onBackgroundMessage(_messageHandler);
      _initialized = true;
    }
  }

  Future<void> _messageHandler(RemoteMessage message) async {
    print('background message ${message.notification!.body}');
  }
}
