import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationService extends ChangeNotifier {
  final String username;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ValueNotifier<String?> notificationMessage = ValueNotifier(null);

  NotificationService({required this.username}) {
    _listenToNotifications();
  }

  void _listenToNotifications() {
    _firestore
        .collection('notifications')
        .where('r_username', isEqualTo: username)
        .snapshots()
        .listen((event) {
          for (var change in event.docChanges) {
            if (change.type == DocumentChangeType.added) {
              final data = change.doc.data();
              final msg = data!['msg'] ?? 'New notification';
              print('🔔 New notification: $msg');
              notificationMessage.value = msg;
            }
          }
        });
  }

  void clearMessage() {
    notificationMessage.value = null;
  }
}
