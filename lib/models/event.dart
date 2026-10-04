import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Event {
  String? id;
  String? uid;
  String? title;
  String? description;
  DateTime? date;
  TimeOfDay? timeOfDay;
  String? category;
  List<String> likes = [];

  Event({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.date,
    required this.timeOfDay,
    required this.category,
    this.likes = const [],
  });

  Map<String, dynamic> toFirestore() {
    int datetime = DateTime(
      date!.year,
      date!.month,
      date!.day,
      timeOfDay!.hour,
      timeOfDay!.minute,
    ).millisecondsSinceEpoch;
    return {
      "id": id,
      "uid": uid,
      "title": title,
      "description": description,
      "dateTime": datetime,
      "category": category,
      "likes": likes,
    };
  }

  factory Event.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final document = snapshot.data();
    int datetime = document?["dateTime"];
    DateTime date = DateTime.fromMillisecondsSinceEpoch(datetime);
    TimeOfDay time = TimeOfDay(hour: date.hour, minute: date.minute);
    var likes = document?["likes"] as List<dynamic>?;
    return Event(
      id: document?["id"],
      uid: document?["uid"],
      title: document?["title"],
      description: document?["description"],
      date: date,
      timeOfDay: time,
      category: document?["category"],
      likes: (likes??[]).map((e) => e.toString()).toList(),
    );
  }
}
