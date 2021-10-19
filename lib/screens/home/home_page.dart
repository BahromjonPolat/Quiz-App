import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/screens/add/add_quiz_page.dart';
import 'package:examtwo/screens/discovery/discovery_page.dart';
import 'package:examtwo/screens/profile/profile_page.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorIndigo,
      appBar: _showAppBar(),
      bottomNavigationBar: _showBottomNavigationBar(),
      body: _pages()[_currentIndex],
    );
  }

  AppBar _showAppBar() => AppBar(
        backgroundColor: colorIndigo,
        elevation: 0.0,
        title: setSimpleBoldText(
          _titles[_currentIndex],
          color: colorWhite,
          size: 24.0,
        ),
      );

  _homePage() => Container();

  BottomNavigationBar _showBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: colorIndigo,
        unselectedItemColor: colorGrey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      );

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.compass), label: "Discover"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.add_circled), label: "Add"),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), label: "Profile"),
  ];

  List<Widget> _pages() => [
        _homePage(),
        DiscoverPage(),
        AddQuizPage(),
        ProfilePage(),
      ];

  final List<String> _titles = [
    "Home",
    "Discover",
    "Add",
    "Profile",
  ];
}
