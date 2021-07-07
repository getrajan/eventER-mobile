import 'package:flutter/cupertino.dart';

class EventCategory {
  final String name;
  final int? index;
  final IconData? icon;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  EventCategory({
    required this.name,
    this.index,
    this.icon,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
}

final List<EventCategory> eventCategories = [
  EventCategory(name: "Health", index: 1),
  EventCategory(name: "Education", left: 110.0, top: 20.0, index: 2),
  EventCategory(name: "Food", left: 20, top: 110.0, index: 3),
  EventCategory(name: "Music", left: 140.0, top: 130.0, index: 4),
  EventCategory(name: "Agriculture", right: 0, top: 10, index: 5),
  EventCategory(name: "Business", bottom: 30, right: 0, index: 6),
  EventCategory(name: "Sports", bottom: 160.0, right: 30.0, index: 7),
  EventCategory(name: "Fitness", bottom: 30.0, left: 120.0, index: 8),
  EventCategory(name: "Retail", left: 0, bottom: 50, index: 9)
];

List<Widget> categoriesStack = [];
