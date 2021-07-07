import 'dart:convert';

import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

class Event extends EventEntity {
  final String title;
  final String location;
  final String date;
  final String coverPhoto;

  Event({
    required this.title,
    required this.location,
    required this.date,
    required this.coverPhoto,
  }) : super(title: "", date: "", location: "", coverPhoto: "");

  Event copyWith({
    String? title,
    String? location,
    String? date,
    String? coverPhoto,
  }) {
    return Event(
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      coverPhoto: coverPhoto ?? this.coverPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'date': date,
      'coverPhoto': coverPhoto,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'],
      location: map['location'],
      date: map['date'],
      coverPhoto: map['coverPhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
