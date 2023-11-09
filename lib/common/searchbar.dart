import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: MaterialStateProperty.all(Colors.red.withOpacity(0.36)),

      // Search Icon
      leading: Icon(
        IconlyLight.search,
        color: Colors.white,
      ),
    );
  }
}