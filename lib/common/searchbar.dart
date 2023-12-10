import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import 'colors.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({Key? key, this.onChanged}) : super(key: key);
  final Function(String)? onChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: SearchBar(
        backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 207, 51, 54).withOpacity(0.5)),
        onChanged: widget.onChanged,
        // Search Icon
        leading: Icon(
          IconlyLight.search,
          color: CustomColors.white,
        ),
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
        hintText: "Search",
        hintStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(
            color: CustomColors.white.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: CustomColors.white,
            fontSize: 14,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                8.0), // Adjust the value for less roundy corners
          ),
        ), // Adjust the value to reduce the height
      ),
    );
  }
}
