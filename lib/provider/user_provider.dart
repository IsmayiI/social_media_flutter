import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'provider.dart';

class UserProvider extends ChangeNotifier {
  Map<String, dynamic>? user;

  void updateWithAuth(AuthProvider authProvider) {
    final currentUser = authProvider.user;
    if (currentUser != null) {
      _getUserDetails(currentUser.uid);
    }
  }

  void _getUserDetails(String uid) async {
    final userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    final userData = userSnapshot.data();
    if (userData != null) {
      user = userData;
      notifyListeners();
    }
  }
}
