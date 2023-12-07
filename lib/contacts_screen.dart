import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'apis.dart';
import 'chat_screen.dart';
import 'common/app_colors.dart';
import 'common/app_text_style.dart';
import 'models/chat_user.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ChatUser> list = [];
  List<ChatUser> searchList = [];
  bool _isSearching = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // Đảm bảo rằng bạn giải phóng FocusNode khi không cần thiết nữa để tránh rò rỉ bộ nhớ
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Thêm lắng nghe sự kiện khi TextField được focus
    //_focusNode.addListener(_onFocusChange);


    //APIs.getSelfInfo();
  }
  void _onFocusChange() {
    // Nơi xử lý sự kiện khi TextField được focus hoặc mất focus
    if (_focusNode.hasFocus) {
      _isSearching = !_isSearching;
      print('TextField is focused');
    } else {
      _isSearching = !_isSearching;
      print('TextField lost focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///Ẩn bản phím khi click ra bên ngoài màn hình
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        ///Nếu đang search và ấn nút back
        ///hoặc là ở màn hình chính và ấn nút back
        onWillPop: (){
          if(_isSearching){
            setState(() {
              _isSearching = !_isSearching;
              _searchController.clear();
            });
          }else{
            setState(() {
              ///reset gái trị search
              _searchController.clear();
            });
          }
          return Future.value(false);
        },
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(
            top: 14,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contacts",
                      style: AppTextStyle.primaryS18W600,
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        "assets/vectors/ic_add.svg",
                        width: 14,
                        height: 14,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
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
                    focusNode: _focusNode,
                    onChanged: (value){
                      searchList.clear();

                      for(var i in list){
                        if(i.name.toLowerCase().contains(value.toLowerCase())){
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
              StreamBuilder(
                  stream: APIs.getAllUser(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      //if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );

                      //if some or all data is loaded then show it
                      case ConnectionState.active:
                      case ConnectionState.done:

                        final data = snapshot.data?.docs;
                        list = data?.map((e) => ChatUser.fromJson(e.data())).toList()??[];

                        // for (var i in data!) {
                        //   list.add(i.data());
                        //   print(jsonEncode(i.data()));
                        // }

                        ///print(list[index]['name']);
                        return Expanded(
                          child: ListView.separated(
                              itemCount:_isSearching || _searchController.text.isNotEmpty ? searchList.length : list.length,
                              separatorBuilder: (context, index) {
                                return Container(
                                  color: AppColors.borderPrimary,
                                  height: 1,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 24),
                                );
                              },
                              itemBuilder: (context, index) {
                                return GestureDetector
                                  (
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (_) => ChatScreen(user: _isSearching || _searchController.text.isNotEmpty ? searchList[index] : list[index])));
                                  },
                                    child: widgetContract(_isSearching || _searchController.text.isNotEmpty ? searchList[index] : list[index]));
                              }),
                        );
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}

Widget widgetContract (ChatUser user){
  return Container(
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
            child: Container(
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
                          imageUrl: user.image,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Text(
                            convertName(user.name.toString()),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xFF2CC069),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(bottom: 15),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 2),
                  child: Text(
                    user.name.toString(),
                    style:
                    AppTextStyle.primaryS14W600,
                  ),
                ),
                Text(
                  user.status.toString(),
                  style: AppTextStyle.primaryS12W400
                      .copyWith(
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
}

String convertName (String name){
  List<String> tmp = name.split(" ");
  String result = "";
  for (var item in tmp) {
    result += item[0];
  }
  return result;
}

class UserEntity {
  final String? avatar;
  final String? userName;
  final String? status;

  UserEntity({
    this.status,
    this.avatar,
    this.userName,
  });
}

List<UserEntity> users = [
  UserEntity(
    avatar:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz4bCSBiL3114mq9BSIZmJ3Rq6huVNeW053516pM5IhIZeNtVGvSWtaXrE12AJUSSHij0&usqp=CAU",
    userName: "Athalia Putri",
    status: "Last seen yesterday",
  ),
  UserEntity(
    avatar:
        "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
    userName: "Erlan Sadewa",
    status: "Online",
  ),
  UserEntity(
    avatar: "https://forumine.com/download/file.php?avatar=54_1519777959.jpg",
    userName: "Midala Huera",
    status: "Last seen 3 hours ago",
  )
];
