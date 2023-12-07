import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:messenger/models/chat_user.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static late ChatUser me;

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



  ///ChatScreen
  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllMessages(){
    return firestore.collection('messages').snapshots();
  }
}