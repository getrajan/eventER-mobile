import 'dart:convert';

import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String? id;
  final String? title;
  final String? duration;
  final String? description;
  final String? coverImageUrl;
  final String? startDateTime;
  final String? endDateTime;
  final String? createdById;
  final double? price;
  final List<String>? featureImages;

  EventEntity({
    this.id,
    this.title,
    this.duration,
    this.description,
    this.coverImageUrl,
    this.startDateTime,
    this.endDateTime,
    this.createdById,
    this.price,
    this.featureImages,
  });

  @override
  List<Object?> get props => [];

  EventEntity copyWith({
    String? id,
    String? title,
    String? duration,
    String? description,
    String? coverImageUrl,
    String? startDateTime,
    String? endDateTime,
    String? createdById,
    double? price,
    List<String>? featureImages,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      createdById: createdById ?? this.createdById,
      price: price ?? this.price,
      featureImages: featureImages ?? this.featureImages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'startDateTime': startDateTime,
      'endDateTime': endDateTime,
      'createdById': createdById,
      'price': price,
      'featureImages': featureImages,
    };
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      description: map['description'],
      coverImageUrl: map['coverImageUrl'],
      startDateTime: map['startDateTime'],
      endDateTime: map['endDateTime'],
      createdById: map['createdById'],
      price: map['price'],
      featureImages: List<String>.from(map['featureImages']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) =>
      EventEntity.fromMap(json.decode(source));
}
