import 'package:flutter/material.dart';

class SearchCategories extends StatelessWidget {
  const SearchCategories({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
      dense: true,
      title: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
