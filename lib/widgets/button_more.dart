import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/common/app_text_style.dart';

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
