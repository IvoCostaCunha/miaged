import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miaged/views/basketPage.dart';
import 'package:miaged/views/loginPage.dart';
import 'firebase_options.dart';

import 'productListPage.dart';
import 'profilePage.dart';
import 'basketPage.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  logout() {
    //logout ...
    Fluttertoast.showToast(
        msg: "Déconnecté !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        fontSize: 14.0);
      Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
    
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w500);

  final List<Widget> children = [
    ProductPage(),
    ProfilePage(
      name: "testuser",
      email: "testmail",
      profileImageUrl:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/e0669842500551.57ceb10667918.jpg",
    ),
    BasketPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('The Shop !'),
          backgroundColor: Color.fromRGBO(51, 101, 138, 1),
          actions: [
            IconButton(
                onPressed: logout,
                icon: Icon(Icons.logout_rounded),
                disabledColor: Colors.white,
                color: Colors.white)
          ]),
      body: Center(child: children[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        backgroundColor: Color.fromRGBO(51, 101, 138, 1),
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Basket',
          ),
        ],
      ),
    );
  }
}
