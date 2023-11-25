import 'package:flutter/material.dart';
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
    return SearchBar(
      backgroundColor:
          MaterialStateProperty.all(CustomColors.red.withOpacity(0.36)),
      onChanged: widget.onChanged,

      // Search Icon
      leading: Icon(
        IconlyLight.search,
        color: CustomColors.white,
      ),
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
      hintText: "Search",
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: CustomColors.white.withOpacity(0.5),
          fontSize: 16,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          color: CustomColors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
