import 'dart:convert';

import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  EventEntity({
    required this.title,
    required this.location,
    required this.date,
    required this.coverPhoto,
  });

  @override
  List<Object?> get props => [];

  final String title;
  final String location;
  final String date;
  final String coverPhoto;

  EventEntity copyWith({
    String? title,
    String? location,
    String? date,
    String? coverPhoto,
  }) {
    return EventEntity(
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

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      title: map['title'],
      location: map['location'],
      date: map['date'],
      coverPhoto: map['coverPhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) =>
      EventEntity.fromMap(json.decode(source));
}
