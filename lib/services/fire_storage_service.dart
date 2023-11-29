import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:messenger/models/phone_number.dart';

class FireStorageService {
  final CollectionReference _phoneCollectionReference =
      FirebaseFirestore.instance.collection('phoneNumber');

  Future createPhoneNumber(PhoneNumber phoneNumber) async {
    try {
      await _phoneCollectionReference
          .doc(phoneNumber.phone)
          .set(phoneNumber.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
