import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'dart:io';
import 'package:messenger/models/message.dart';
import 'chat_user.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  static Future<void> getFirebaseMessagingToken() async {
    await fMessaging.requestPermission();

    await fMessaging.getToken().then((t) {
      if (t != null) {
        me.pushToken = t;
        print('Push Token: $t');
      }
    });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');
    //
    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    // });
  }

  // for sending push notification
  static Future<void> sendPushNotification(
      ChatUser chatUser, String msg) async {
    try {
      final body = {
        "to": chatUser.pushToken,
        "notification": {
          "title": me.name, //our name should be send
          "body": msg,
          "android_channel_id": "chats"
        },
        "data": {
          "some_data": "User ID: ${me.id}",
        },
      };

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
            'key=AAAAGQ8nkh8:APA91bGNKu-MIM1NkaTFP1QktlBFiNFLoPB1shf3KCYPiK4Nfj3XIAymyGszVb03q1E5ritShNt6kysqRAp-t7FA6-O4SlhRZXN3jQ2EYmL9jkEU2xyy_8_21byYVY6VUTxdK3plOv1x'
          },
          body: jsonEncode(body));
      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');
    } catch (e) {
      print('\nsendPushNotificationE: $e');
    }
  }

  static ChatUser me = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      status: 'Hello',
      image: user.photoURL.toString(),
      isOnline: false,
      lastActive: '',
      pushToken: ''
  );

  ///to return current user
  static User get user => auth.currentUser!;

  ///for cheking if user exists or not ?
  static Future<bool> userExists() async{
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  ///getting current user info
  static Future<void> getSelfInfo() async{
    await firestore.collection('users').doc(user.uid).get().then((user) async{
      if(user.exists)
        {
          me = ChatUser.fromJson(user.data()!);
          await getFirebaseMessagingToken();
          APIs.updateActiveStatus(true);
        }
      else{
         await createUser().then((value) => getSelfInfo());
      }
    });
  }

  // for updating user information
  static Future<void> updateUserInfo() async {
    await firestore.collection('users').doc(user.uid).update({
      'name': me.name,
      'status': me.status,
    });
  }

  /// for createing a new user
  static Future<void> createUser() async{
    final time = DateTime.now().microsecondsSinceEpoch.toString();
    final chatUser = ChatUser(
      id: user.uid,
      name: user.displayName.toString(),
      email: user.email.toString(),
      isOnline: false,
      image: user.photoURL.toString(),
      pushToken: '',
      lastActive: time,
      status: '',
    );
    return await firestore.collection('users').doc(user.uid).set(chatUser.toJson());
  }

  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllUser(){
    return APIs.firestore.collection('users').where('id',isNotEqualTo: user.uid).snapshots();
  }

  //Convert id
  static String getConversationID(String id)=> user.uid.hashCode <= id.hashCode ? '${user.uid}_$id' : '${id}_${user.uid}';

  //ChatScreen
  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllMessages(ChatUser chatUser){
    return firestore.collection('chats/${getConversationID(chatUser.id)}/messages/').snapshots();
  }
  // send message
  static Future<void> sendMessage(
      ChatUser chatUser, String msg, Type type) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toId: chatUser.id,
        msg: msg,
        read: '',
        type: type,
        fromId: user.uid,
        sent: time);

    final ref = firestore
        .collection('chats/${getConversationID(chatUser.id)}/messages/');
    await ref.doc(time).set(message.toJson()).then((value) =>
        sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
  }

  //send chat image
  static Future<void> sendChatImage(ChatUser chatUser, File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;

    //storage file ref with path
    final ref = storage.ref().child(
        'images/${getConversationID(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      print('Data Transferred: ${p0.bytesTransferred / 1000} kb');
    });

    //updating image in firestore database
    final imageUrl = await ref.getDownloadURL();
    await sendMessage(chatUser, imageUrl, Type.image);
  }

  //Update read status message
  static Future<void> updateMessageReadStatus(Message message) async{
    firestore.collection('chats/${getConversationID(message.fromId)}/messages/')
        .doc(message.sent)
        .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  }

  //get only last message of a specific chat
  static Stream<QuerySnapshot> getLastMessage(ChatUser user){
    return firestore
        .collection('chats/${getConversationID(user.id)}/messages/')
        .orderBy('sent',descending: true)
        .limit(1)
        .snapshots();
  }
  static Stream<String> getTimeLastMessage(ChatUser user) {
    return FirebaseFirestore.instance
        .collection('chats/${getConversationID(user.id)}/messages/')
        .orderBy('sent', descending: true)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        Message message =Message.fromSnapshot(querySnapshot.docs.first);
        return message.sent;
      } else {
        throw Exception('');
      }
    });
  }


  static Future<void> updateProfilePicture(File file) async {
    //getting image file extension
    final ext = file.path.split('.').last;

    //storage file ref with path
    final ref = storage.ref().child('profile_pictures/${user.uid}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
    });

    //updating image in firestore database
    me.image = await ref.getDownloadURL();
    await firestore
        .collection('users')
        .doc(user.uid)
        .update({'image': me.image});
  }

  static Future<void> updateActiveStatus(bool isOnline) async {
    firestore.collection('users').doc(user.uid).update({
      'is_Online': isOnline,
      'last_Active': DateTime.now().millisecondsSinceEpoch.toString(),
      'push_Token': me.pushToken,
    });
  }

}