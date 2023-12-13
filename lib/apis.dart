import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:messenger/models/message.dart';
import 'models/chat_user.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

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
  static Future<void> sendMessage(ChatUser chatUser, String msg) async{
    //Message sending time
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    //Message to send
    final Message message = Message(msg: msg, toId: chatUser.id, read: '', type: Type.text, sent: time, fromId: user.uid);

    final ref = firestore.collection('chats/${getConversationID(chatUser.id)}/messages/');
    await ref.doc(time).set(message.toJson());
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
}