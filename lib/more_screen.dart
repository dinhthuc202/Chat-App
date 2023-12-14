import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/profile_account.dart';
import 'package:messenger/widgets/button_more.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';
import 'main.dart';
class MoreScreen extends StatefulWidget {
  final ChatUser user;
  const MoreScreen({super.key, required this.user,});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14,left: 24,bottom: 17,),
            child: SizedBox(
              width: double.infinity,
              height: 30,
              child: Text(
                  "More",
                textAlign: TextAlign.left,
                style: AppTextStyle.primaryS18W600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal:16 ),
            child: SizedBox(
              width: 343,
              height: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          APIs.me.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20,bottom: 12,top: 15,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                APIs.me.name,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                style: AppTextStyle.primaryS14W600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2,bottom: 4),
                              child: Expanded(
                                child: Text(
                                  APIs.me.email,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: AppTextStyle.primaryS12W400.copyWith(
                                    color: AppColors.textHintPrimary,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> ProfileAccount(user: APIs.me)));
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        "assets/vectors/ic_arrow_right.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 104,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:4),
              child: Column(
                children: [
                  buttonMore("profile_avata.svg","Account",""),
                  buttonMore("ic_chat.svg","Chats",""),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            height: 353,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:4),
              child: Column(
                children: [
                  buttonMore("ic_appereance.svg","Appereance",""),
                  buttonMore("ic_noti.svg","Notification",""),
                  buttonMore("ic_privacy.svg", "Privacy", ""),
                  buttonMore("ic_data_usage.svg", "Data usage", ""),

                  ///Logout
                  InkWell(
                    onTap: () async{
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      if(FirebaseAuth.instance.currentUser == null){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MyHomePage(title: "")));
                      }


                      // final isar = IsarService();
                      // final listPhones = await isar.getAllPhoneNumbers();
                      // if(listPhones.isNotEmpty){
                      //   if(context.mounted) {
                      //     final result = await isar.deletePhoneNumber(
                      //         listPhones[0]);
                      //     if (result) {
                      //       Navigator.of(context).pushAndRemoveUntil(
                      //           MaterialPageRoute(
                      //             builder: (context) => MyHomePage(title: "",),
                      //           ), (Route<dynamic> route) => false);
                      //     }
                      //   }
                      // }

                    },
                      child: buttonMore("ic_logout.svg", "Logout", "")),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: AppColors.borderPrimary,
                      height: 1,
                    ),
                  ),
                  buttonMore("ic_help.svg", "Helps", ""),
                  buttonMore("ic_invite_your_friends.svg", "Invite your friend", "")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

