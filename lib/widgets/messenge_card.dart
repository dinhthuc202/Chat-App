import 'package:flutter/material.dart';
import 'package:messenger/common/app_colors.dart';
import 'package:messenger/common/app_text_style.dart';
import '../apis.dart';
import '../models/message.dart';

class MessengeCard extends StatefulWidget {

  final Message message;
  const MessengeCard({super.key, required this.message});

  @override
  State<MessengeCard> createState() => _MessengeCardState();
}

class _MessengeCardState extends State<MessengeCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.fromId ? _greenMessage() : _blueMessage();
  }

  Widget _blueMessage(){
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 16,right: 22,top:6,bottom: 6),
            decoration: BoxDecoration(
              color: Color(0xFF4C85B4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message.msg,
                  style: AppTextStyle.primaryS14W400,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  widget.message.sent,
                  style: AppTextStyle.primaryS10W400.copyWith(
                    color: AppColors.textHintPrimary,
                  ),
                ),
              ],
            ),

          ),
        ),
      ],
    );
  }

  Widget _greenMessage(){
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 16,right: 22,top:6,bottom: 6),
        decoration: BoxDecoration(
            color: Color(0xFF002DE3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.message.msg,
              style: AppTextStyle.primaryS14W400.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.message.sent,
                  style: AppTextStyle.primaryS10W400.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.message.read == 'True' ? ' · Read' : '',
                  style: AppTextStyle.primaryS10W400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
