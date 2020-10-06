import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  SingleCard(
      {@required this.onTap,
      @required this.name,
      @required this.gender,
      this.url,
      this.characterInfo});
  final Function onTap;
  final String name;
  final String gender;
  final String url;
  final characterInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        subtitle: Text(gender),
        leading: Icon(
          Icons.image,
          color: Colors.blue,
        ),
      ),
    );
  }
}
