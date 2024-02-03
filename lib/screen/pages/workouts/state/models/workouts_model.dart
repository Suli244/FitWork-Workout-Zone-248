import 'dart:convert';

import 'package:flutter/foundation.dart';

class Workouts {
  String mainImage;
  String title;
  List<Trainings> trainings;
  String? description;
  String? time;
  bool isSatypAluu;
  Workouts({
    required this.mainImage,
    required this.title,
    required this.trainings,
    required this.isSatypAluu,
    this.description,
    this.time,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'mainImage': mainImage});
    result.addAll({'title': title});
    result.addAll({'trainings': trainings.map((x) => x.toMap()).toList()});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (time != null) {
      result.addAll({'time': time});
    }

    return result;
  }

  factory Workouts.fromJson(Map<String, dynamic> map, bool isSatypAluu) {
    return Workouts(
      isSatypAluu: isSatypAluu,
      mainImage: map['mainImage'] ?? '',
      title: map['title'] ?? '',
      trainings: List<Trainings>.from(
          map['trainings']?.map((x) => Trainings.fromJson(x))),
      description: map['description'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Workouts(mainImage: $mainImage, title: $title, trainings: $trainings, description: $description, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Workouts &&
        other.mainImage == mainImage &&
        other.title == title &&
        listEquals(other.trainings, trainings) &&
        other.description == description &&
        other.time == time;
  }

  @override
  int get hashCode {
    return mainImage.hashCode ^
        title.hashCode ^
        trainings.hashCode ^
        description.hashCode ^
        time.hashCode;
  }
}

class Trainings {
  final int calories;
  final String description;
  final String level;
  final int minutes;
  final String title;
  final String image;
  Trainings({
    required this.calories,
    required this.description,
    required this.level,
    required this.minutes,
    required this.title,
    required this.image,
  });

  Trainings copyWith({
    int? calories,
    String? description,
    String? level,
    int? minutes,
    String? title,
    String? image,
  }) {
    return Trainings(
      calories: calories ?? this.calories,
      description: description ?? this.description,
      level: level ?? this.level,
      minutes: minutes ?? this.minutes,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'calories': calories});
    result.addAll({'description': description});
    result.addAll({'level': level});
    result.addAll({'minutes': minutes});
    result.addAll({'title': title});
    result.addAll({'image': image});

    return result;
  }

  factory Trainings.fromJson(Map<String, dynamic> map) {
    return Trainings(
      calories: map['calories']?.toInt() ?? 0,
      description: map['description'] ?? '',
      level: map['level'] ?? '',
      minutes: map['minutes']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Trainings(calories: $calories, description: $description, level: $level, minutes: $minutes, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trainings &&
        other.calories == calories &&
        other.description == description &&
        other.level == level &&
        other.minutes == minutes &&
        other.title == title &&
        other.image == image;
  }

  @override
  int get hashCode {
    return calories.hashCode ^
        description.hashCode ^
        level.hashCode ^
        minutes.hashCode ^
        title.hashCode ^
        image.hashCode;
  }
}
