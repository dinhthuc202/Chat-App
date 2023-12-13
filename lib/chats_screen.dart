import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/apis.dart';
import 'package:messenger/models/chat_user.dart';

import 'common/app_colors.dart';
import 'common/app_text_style.dart';
class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key,});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chats",
                    style: AppTextStyle.primaryS18W600,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          "assets/vectors/ic_message_plus_alt.svg",
                          width: 14,
                          height: 14,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(width: 8,),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          "assets/vectors/ic_list_check.svg",
                          width: 14,
                          height: 14,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 56,
              height: 76,
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textHintPrimary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: SvgPicture.asset(
                      "assets/vectors/ic_add.svg",
                      width: 14,
                      height: 14,
                      color: AppColors.textHintPrimary,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "Your Story",
                    style: AppTextStyle.primaryS10W400,
                  )
                ],
              ),
            ),

            SizedBox(
              width: 56,
              height: 76,
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD2D5F9), Color(0xFF2C37E1)], // Màu sắc của gradient
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "Nguyễn Đình Thực",
                    style: AppTextStyle.primaryS10W400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
