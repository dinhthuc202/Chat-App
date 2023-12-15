import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/common/app_colors.dart';
import 'package:messenger/common/app_text_style.dart';
import 'package:messenger/models/message.dart';
import 'package:messenger/models/my_date_util.dart';

class MessengeCard extends StatefulWidget {
  final Message message;

  const MessengeCard({super.key, required this.message});

  @override
  State<MessengeCard> createState() => _MessengeCardState();
}

class _MessengeCardState extends State<MessengeCard> {
  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.fromId
        ? _greenMessage()
        : _blueMessage();
  }

  Widget _blueMessage() {
    if (widget.message.read.isEmpty) {
      APIs.updateMessageReadStatus(widget.message);
    }
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin:
                const EdgeInsets.only(left: 16, right: 22, top: 6, bottom: 6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.message.type == Type.text
                    ? Text(
                        widget.message.msg,
                        style: AppTextStyle.primaryS14W400,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: widget.message.msg,
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image, size: 70),
                        ),
                      ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  MyDateUtil.getFormattedTime(
                      context: context, time: widget.message.sent),
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

  Widget _greenMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin:
                const EdgeInsets.only(left: 22, right: 16, top: 6, bottom: 6),
            decoration: const BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.message.type == Type.text
                    ? Text(widget.message.msg,
                        style: AppTextStyle.primaryS14W400.copyWith(
                          color: Colors.white,
                        ))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: widget.message.msg,
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image, size: 70),
                        ),
                      ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      MyDateUtil.getFormattedTime(
                          context: context, time: widget.message.sent),
                      style: AppTextStyle.primaryS10W400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.message.read == '' ? '' : ' · Read',
                      style: AppTextStyle.primaryS10W400.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
