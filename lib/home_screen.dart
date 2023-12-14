import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:messenger/models/apis.dart';
import 'package:messenger/models/chat_user.dart';
import 'chats_screen.dart';
import 'contacts_screen.dart';
import 'widgets/dot_widget.dart';
import 'more_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APIs.getSelfInfo();
    SystemChannels.lifecycle.setMessageHandler((message) {
      print(message);
      if(message.toString().contains('resume')) APIs.updateActiveStatus(true);
      if(message.toString().contains('pause')) APIs.updateActiveStatus(false);
      return Future.value(message);
    });
  }
  int _selectedIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: <Widget>[
            ContactsScreen(),
            ChatsScreen(),
            MoreScreen(user: APIs.me),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
          fontSize: 2,
        ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/vectors/ic_contact.svg",),
                activeIcon: const Column(
                  children: [
                    SizedBox(height: 8,),
                    Text(
                      "Contacts",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F1828),
                      ),
                    ),
                    SizedBox(height: 8,),
                    DotWidget(),
                  ],
                ),
              label:".",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/vectors/ic_chat.svg",),
              activeIcon: const Column(
                children: [
                  SizedBox(height: 8,),
                  Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F1828),
                    ),
                  ),
                  SizedBox(height: 8,),
                  DotWidget(),
                ],
              ),
              label:".",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/vectors/ic_more.svg",),
              activeIcon: const Column(
                children: [
                  SizedBox(height: 8,),
                  Text(
                    "More",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F1828),
                    ),
                  ),
                  SizedBox(height: 8,),
                  DotWidget(),
                ],
              ),
              label:".",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
              controller.jumpToPage(index);
            });
          },
          elevation: 5,
      ),
    );
  }
}

