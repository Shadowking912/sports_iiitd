import 'package:flutter/material.dart';

Row customAppBar(String title, bool goBack, BuildContext context,
    {bool logo = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          goBack
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )
              : Container(),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      logo
          ? Image.asset(
              'assets/logo.png',
              height: 60,
              width: 60,
            )
          : Container(),
    ],
  );
}
