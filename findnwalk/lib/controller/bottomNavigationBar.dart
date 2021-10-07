import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:findnwalk/components/colors.dart';
import 'package:findnwalk/pages/eventsPage.dart';
import 'package:findnwalk/pages/historyPage.dart';
import 'package:findnwalk/pages/homePage.dart';
import 'package:flutter/material.dart';

class BottomFNBar extends StatefulWidget {
  const BottomFNBar({Key? key}) : super(key: key);

  @override
  _BottomFNBarState createState() => _BottomFNBarState();
}

class _BottomFNBarState extends State<BottomFNBar> {
  var listIndex = 0;
  var pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            EventsPage(),
            HomePage(),
            HistoryPage(),
          ],
          onPageChanged: (index) {
            setState(() {
              listIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: listIndex,
        backgroundColor: AppColors.transparent,
        color: AppColors.orange,
        items: const <Widget>[
          Icon(
            Icons.list,
            size: 30,
            color: AppColors.black,
          ),
          Icon(
            Icons.home,
            size: 40,
            color: AppColors.black,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: AppColors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            listIndex = index;
          });
          pageController.jumpToPage(listIndex);
          pageController.animateToPage(listIndex,
              duration: Duration(microseconds: 800), curve: Curves.easeInOut);
        },
      ),
    );
  }
}
