import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

// Events eventToJson

class Events {
  Events({
    required this.events,
  });

  List<Event> events;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.id,
    required this.content,
    required this.postType,
    required this.name,
    this.dateOfEvent,
    required this.location,
    required this.tags,
    required this.createdById,
    required this.createdAt,
    required this.participantName,
    required this.eventName,
  });

  String id;
  String content;
  String postType;
  String name;
  dynamic dateOfEvent;
  String location;
  List<String> tags;
  String createdById;
  DateTime createdAt;
  String participantName;
  String eventName;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
      id: json["ID"],
      content: json["content"],
      postType: json["postType"],
      name: json["name"],
      dateOfEvent: json["dateOfEvent"],
      location: json["location"],
      tags: List<String>.from(json["tags"].map((x) => x)),
      createdById: json["createdById"],
      createdAt: DateTime.parse(json["createdAt"]),
      participantName: json["name"],
      eventName: json["eventName"]);

  Map<String, dynamic> toJson() => {
        "ID": id,
        "content": content,
        "postType": postType,
        "name": name,
        "dateOfEvent": dateOfEvent,
        "location": location,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "createdById": createdById,
        "createdAt": createdAt.toIso8601String(),
      };
}
