import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/models/chat_user.dart';
import 'package:messenger/widgets/chat_user_card.dart';
import 'package:messenger/widgets/stories.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({
    super.key,
  });

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatUser> list = [];
  List<ChatUser> searchList = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: StreamBuilder(
            stream: APIs.getAllUser(),
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
                  list =
                      data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                          [];
                  return Column(
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
                                const SizedBox(
                                  width: 8,
                                ),
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
                      Container(
                        height: 108,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, right: 8),
                              child: SizedBox(
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
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Your Story",
                                      style: AppTextStyle.primaryS10W400,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: list.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 16),
                                      child: Stories(
                                          list[index].name, list[index].image),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Container(
                          width: 327,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.backgroundInput,
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              searchList.clear();

                              for (var i in list) {
                                if (i.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase())) {
                                  searchList.add(i);
                                }
                                setState(() {
                                  searchList;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: AppTextStyle.primaryS14W600.copyWith(
                                color: AppColors.textHintPrimary,
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                color: AppColors.textHintPrimary,
                                onPressed: () {
                                  // Perform the search here
                                },
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemCount: _isSearching ||
                                    _searchController.text.isNotEmpty
                                ? searchList.length
                                : list.length,
                            separatorBuilder: (context, index) {
                              return Container(
                                color: AppColors.borderPrimary,
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                              );
                            },
                            itemBuilder: (context, index) {
                              return ChatUserCard(
                                  user: _isSearching ||
                                          _searchController.text.isNotEmpty
                                      ? searchList[index]
                                      : list[index]);
                            }),
                      ),
                    ],
                  );
              }
            }),
      ),
    );
  }
}
