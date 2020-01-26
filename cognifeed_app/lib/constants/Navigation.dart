import 'package:flutter/material.dart';

class Navigation{
  final IconData icon;
  const Navigation(this.icon)
}

const List<Navigation> allNavigations=<Navigation>[
  Navigation(
    Icons.home,
  ),
  Navigation(Icons.settings,),
  Navigation(Icons.bookmark,),
  Navigation(Icons.verified_user,),
]
