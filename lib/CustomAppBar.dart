import 'package:flutter/material.dart';
import 'package:oneclick/main.dart';
/*
class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  int index = 2;

  CustomAppBar() {
    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "WishList",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (int indx) {},
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
*/

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  int index = 2;

  _CustomNavigationBarState() {
    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "WishList",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: TextStyle(color: Colors.black),
        )));

    bottomBarItems.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (int indx) {
          setState(() {
            index = indx;
          });
        },
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
