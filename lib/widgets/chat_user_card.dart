import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/chat_screen.dart';
import 'package:messenger/common/app_colors.dart';
import 'package:messenger/common/app_text_style.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/models/message.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  //last message info (if null --> no message)
  Message? _message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //for navigating to chat screen
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user)));
        },
        child: StreamBuilder(
          stream: APIs.getLastMessage(widget.user),
          builder: (context, snapshot) {
            final data = snapshot.data?.docs;
            final list = data
                    ?.map((e) =>
                        Message.fromJson(e.data() as Map<String, dynamic>))
                    .toList() ??
                [];
            if (list.isNotEmpty) _message = list[0];
            return _message == null
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                              bottom: 12,
                            ),
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 48,
                                      width: 48,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.user.image,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Text(
                                            convertName(
                                                widget.user.name.toString()),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  widget.user.isOnline
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 36.0),
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF2CC069),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    widget.user.name.toString(),
                                    style: AppTextStyle.primaryS14W600,
                                  ),
                                ),
                                Text(
                                  _message!.type == Type.image
                                      ? 'Image: 🖼'
                                      : _message!.msg,
                                  maxLines: 1,
                                  style: AppTextStyle.primaryS12W400.copyWith(
                                    color: AppColors.textHintPrimary,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}

String convertName(String name) {
  List<String> tmp = name.split(" ");
  String result = "";
  for (var item in tmp) {
    result += item[0];
  }
  return result;
}
