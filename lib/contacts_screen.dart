import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 14,),
        child: Column(
          children: [
            SizedBox(
              width: 327,
              height: 30,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8,),
                    child: SizedBox(
                      width:295,
                      height: 30,
                      child: Text(
                        "Contacts",
                        style: TextStyle(
                          color: Color(0xFF0F1828),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
                  color: const Color(0xFFF7F7FC),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Color(0xFFADB5BD),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      color: const Color(0xFFADB5BD),
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
                itemCount: users.length,
                  separatorBuilder: (context, index){
                  return Container(
                    color: const Color(0xFFEDEDED),
                    height: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                  );
                  },
                  itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24,right: 24,top: 16,),
                        child: Row(
                          children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12,bottom: 12,),
                            child: SizedBox(
                              height: 56,
                              width: 56,
                              child: Center(
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16,),
                                    image: DecorationImage(
                                        image: NetworkImage("${users[index].avatar}"),
                                    )
                                  ),
                                ),
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
                                      "${users[index].userName}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF0F1828),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${users[index].status}",
                                    style: const TextStyle(
                                      color: Color(0xFFADB5BD),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
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
              ),
            ),
          ],
        ),
      )
    );
  }
}

class UserEntity{
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
    avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz4bCSBiL3114mq9BSIZmJ3Rq6huVNeW053516pM5IhIZeNtVGvSWtaXrE12AJUSSHij0&usqp=CAU",
    userName: "Athalia Putri",
    status: "Last seen yesterday",
  ),
  UserEntity(
    avatar: "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
    userName: "Erlan Sadewa",
    status: "Online",
  ),
  UserEntity(
    avatar: "https://forumine.com/download/file.php?avatar=54_1519777959.jpg",
    userName: "Midala Huera",
    status: "Last seen 3 hours ago",
  )

];

