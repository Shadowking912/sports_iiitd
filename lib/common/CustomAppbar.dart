import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'colors.dart';

Row customAppBar(String title, BuildContext context,
    {bool logo = false, bool goBack = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          goBack
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        IconlyLight.arrow_left,
                        color: CustomColors.red,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Go Back",
                        style: TextStyle(color: CustomColors.red, fontSize: 16),
                      ),
                    ],
                  ),
                )
              : Container(),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: CustomColors.white,
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
