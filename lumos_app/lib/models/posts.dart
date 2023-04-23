import 'dart:convert';

List<Events> eventsFromJson(String str) => List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
    Events({
        required this.id,
        required this.content,
        required this.postType,
        required this.name,
        this.dateOfEvent,
        required this.location,
        required this.imageUrl,
        required this.tags,
        required this.createdById,
        required this.createdAt,
    });

    String id;
    String content;
    String postType;
    String name;
    dynamic dateOfEvent;
    String location;
    String imageUrl;
    List<String> tags;
    String createdById;
    DateTime createdAt;

    factory Events.fromJson(Map<String, dynamic> json) => Events(
        id: json["ID"],
        content: json["content"],
        postType: json["postType"],
        name: json["name"],
        dateOfEvent: json["dateOfEvent"],
        location: json["location"],
        imageUrl: json["imageUrl"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        createdById: json["createdById"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "content": content,
        "postType": postType,
        "name": name,
        "dateOfEvent": dateOfEvent,
        "location": location,
        "imageUrl": imageUrl,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "createdById": createdById,
        "createdAt": createdAt.toIso8601String(),
    };
}