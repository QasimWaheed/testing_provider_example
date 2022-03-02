import 'dart:collection';

import 'package:flutter/material.dart';

import '../model/bread_crumb.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumbs;
  final OnBreadCrumbTapped onBreadCrumbTapped;

  const BreadCrumbWidget({
    Key? key,
    required this.onBreadCrumbTapped,
    required this.breadCrumbs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((breadCrumb) {
        return GestureDetector(
          onTap: () => onBreadCrumbTapped(breadCrumb),
          child: Text(
            breadCrumb.title,
            style: TextStyle(
              color: breadCrumb.isActive ? Colors.blue : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}