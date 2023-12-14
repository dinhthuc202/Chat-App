import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/models/message.dart';
import 'models/apis.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';
import 'models/chat_user.dart';
import 'widgets/messenge_card.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _list = [];

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 13,),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        "assets/vectors/ic_arrow_left.svg",
                        width: 7.42,
                        height: 12.02,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      widget.user.name,
                      style: AppTextStyle.primaryS18W600,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      "assets/vectors/ic_search.svg",
                      width: 7.42,
                      height: 12.02,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      "assets/vectors/ic_menu.svg",
                      width: 7.42,
                      height: 12.02,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: APIs.getAllMessages(widget.user),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    _list = data
                        ?.map((e) => Message.fromJson(e.data()))
                        .toList() ??
                        [];

                    if (_list.isNotEmpty) {
                      return ListView.builder(
                          itemCount: _list.length,
                          padding: const EdgeInsets.only(top: 5),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MessengeCard(
                              message: _list[index],
                            );
                          });
                    } else {
                      return const Center(
                        child: Text(
                          'Say hi!',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      );
                    }
                }
              },
            ),
          ),
          Container(
            color: AppColors.borderPrimary,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: chatInput(),
          ),
        ],
      )),
    );
  }

  Widget chatInput() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              "assets/vectors/ic_add.svg",
              color: AppColors.textHintPrimary,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: textEditingController,
                style: AppTextStyle.primaryS14W600,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 5.0,left: 8,),
                  filled: true,
                  fillColor: AppColors.backgroundInput,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
              ),
          ),
        ),
            )),
        InkWell(
          onTap:(){
            if(textEditingController.text.isNotEmpty){
              APIs.sendMessage(widget.user, textEditingController.text);
              textEditingController.text = '';
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                "assets/vectors/ic_send.svg",
                color: AppColors.colorPrimary,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
