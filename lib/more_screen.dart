import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger/services/isar_service.dart';

import 'common/app_colors.dart';
import 'common/app_text_style.dart';
import 'main.dart';
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

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
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color:  AppColors.backgroundInput,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              "assets/vectors/profile_avata.svg",
                              width: 16,
                              height: 19,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:20,bottom: 12,top: 8,),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  "Almayra Zamzamy",
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: AppTextStyle.primaryS14W600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 4),
                                child: Expanded(
                                  child: Text(
                                    "+62 1309 - 1710 - 1920",
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
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      "assets/vectors/ic_arrow_right.svg",
                      fit: BoxFit.scaleDown,
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
                      final isar = IsarService();
                      final listPhones = await isar.getAllPhoneNumbers();
                      if(listPhones.isNotEmpty){
                        if(context.mounted) {
                          final result = await isar.deletePhoneNumber(
                              listPhones[0]);
                          if (result) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(title: "",),
                                ), (Route<dynamic> route) => false);
                          }
                        }
                      }
                    },
                      child: buttonMore("ic_logout.svg", "Logout", "")),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: AppColors.borderPrimary,
                      width: 343,
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


  Widget buttonMore (String iconName, String content, String urlPush){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: 343,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset("assets/vectors/$iconName",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                SizedBox(
                  height: 24,
                  child: Center(
                    child: Text(
                      content,
                      style: AppTextStyle.primaryS14W600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/vectors/ic_arrow_right.svg",
                colorFilter: const ColorFilter.mode(Color(0xFF0F1828), BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      ),
    );
  }
}

