import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar("SETTINGS", true, context, logo: true),
            SettingsTab("Account Details", "assets/shieldfail.png"),
            SettingsTab("Notifications", "assets/notificationbell.png"),
            SettingsTab("Privacy Policy", "assets/dangercircle.png"),
            SettingsTab("Event Details", "assets/document.png"),
            SettingsTab("Community Guidelines", "assets/work.png"),
            SettingsTab("Support", "assets/questionmark.png"),
            LogoutTab("Log out", "assets/login.png")
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  final String tabName;
  final String imageSrc;

  SettingsTab(this.tabName, this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 96, 91, 91),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(children: [
        Expanded(
            child: Row(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 1, 15, 1),
            child: Image.asset(imageSrc),
          ),
          Text(
            tabName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          )
        ])),
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ))
      ]),
    );
  }
}

class LogoutTab extends StatelessWidget {
  final String tabName;
  final String imageSrc;

  LogoutTab(this.tabName, this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 96, 91, 91),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(children: [
        Expanded(
            child: Row(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 1, 5, 1),
            child: TextButton(
              onPressed: () {},
              child: Image.asset(
                imageSrc,
                color: const Color.fromARGB(255, 247, 21, 4),
              ),
            ),
          ),
          Text(
            tabName,
            style: TextStyle(
              color: const Color.fromARGB(255, 247, 21, 4),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          )
        ])),
      ]),
    );
  }
}
