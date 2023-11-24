import 'package:flutter/material.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/screens/settings.dart';

class NotificationsSettingScreen extends StatelessWidget {
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
            customAppBar("NOTIFICATIONS", true, context, logo: true),
            ToggleTab("Push Notifications", "assets/notificationbell.png"),
            SettingsTab("Manage Notifications", "assets/manageicon.png"),
            ToggleTab("SMS Notifications", "assets/sms.png"),
            ToggleTab("Email Notifications", "assets/email.png")
          ],
        ),
      ),
    );
  }
}

class ToggleTab extends StatefulWidget {
  final String tabName;
  final String imageSrc;

  ToggleTab(this.tabName, this.imageSrc);

  @override
  State<ToggleTab> createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> {
  bool toggleState = false;

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
            child: Image.asset(widget.imageSrc),
          ),
          Text(
            widget.tabName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          )
        ])),
        Align(
            alignment: Alignment.centerRight,
            child: Switch(
              value: toggleState,
              activeColor: Colors.white,
              activeTrackColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                  toggleState = value;
                });
              },
            ))
      ]),
    );
  }
}
