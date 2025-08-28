import 'package:ecommerce_admin_app_php/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<void> getAccessToken() async {
  String accessToken = '';

  try {
    final serviceAccountJson = await rootBundle.loadString(
        'HTTP_V1/ecommerceapp-7851c-firebase-adminsdk-fbsvc-9095f91b1f.json');

    final accountCredentials = ServiceAccountCredentials.fromJson(
      json.decode(serviceAccountJson),
    );

    const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final client = http.Client();
    try {
      final accessCredentials = await obtainAccessCredentialsViaServiceAccount(
        accountCredentials,
        scopes,
        client,
      );

      accessToken = accessCredentials.accessToken.data;

      print('Access Token: $accessToken');
    } catch (e) {
      print('Error obtaining access token: $e');
    } finally {
      client.close();
    }
  } catch (e) {
    print('Error loading service account JSON: $e');
  }
}

requestPermissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("========================notification");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("===============Page ID");
  print(data['pageid']);
  print("===============Page NAME");
  print(data['pagename']);
  print("===============Current Route");
  print(Get.currentRoute);
  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderspending") {
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}

