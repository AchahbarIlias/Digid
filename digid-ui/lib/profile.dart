import 'package:flutter/material.dart';
import 'dart:ui';

import './user.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage('assets/Profile.png'),
              width: MediaQuery.of(context).size.height * 0.30,
            ),
          ),
          Container(
            child: widget.user.GetTable(),
            margin: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
