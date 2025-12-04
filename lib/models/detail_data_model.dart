import 'package:flutter/foundation.dart';

@immutable
class DetailDataModel {
  const DetailDataModel({
    required this.name,
    required this.title,
    required this.text,
    required this.img,
    required this.time,
    required this.prize,
  });

  // Factory constructor to create an instance from JSON
  factory DetailDataModel.fromJson(Map<String, dynamic> json) {
    return DetailDataModel(
      name: json['name'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      img: json['img'] as String,
      time: json['time'] as String,
      prize: json['prize'] as String,
    );
  }
  final String name;
  final String title;
  final String text;
  final String img;
  final String time;
  final String prize;

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'text': text,
      'img': img,
      'time': time,
      'prize': prize,
    };
  }

  // Method to create a list of DetailDataModel from JSON array
  static List<DetailDataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DetailDataModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  // CopyWith method for creating modified copies
  DetailDataModel copyWith({
    String? name,
    String? title,
    String? text,
    String? img,
    String? time,
    String? prize,
  }) {
    return DetailDataModel(
      name: name ?? this.name,
      title: title ?? this.title,
      text: text ?? this.text,
      img: img ?? this.img,
      time: time ?? this.time,
      prize: prize ?? this.prize,
    );
  }

  @override
  String toString() {
    return 'DetailDataModel(name: $name, title: $title, text: $text, img: $img, time: $time, prize: $prize)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is DetailDataModel &&
        other.name == name &&
        other.title == title &&
        other.text == text &&
        other.img == img &&
        other.time == time &&
        other.prize == prize;
  }

  @override
  int get hashCode {
    return Object.hash(name, title, text, img, time, prize);
  }
}
