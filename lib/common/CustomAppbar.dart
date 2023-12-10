import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'colors.dart';

Row customAppBar(String title, BuildContext context,
    {bool logo = false, bool goBack = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
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
                          style: GoogleFonts.poppins(
                              color: CustomColors.red, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                : Container(),
            Text(
              title,
              style: GoogleFonts.anton(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: CustomColors.white,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      logo
          ? Image.asset(
              'assets/sportscouncil_logo.png',
              height: 45,
              width: 45,
            )
          : Container(),
    ],
  );
}
