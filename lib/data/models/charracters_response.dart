
class CharactersResponse {
  CharactersResponse({
      this.info, 
      this.results,});

  CharactersResponse.fromJson(dynamic json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Character.fromJson(v));
      });
    }
  }
  Info? info;
  List<Character>? results;
}

class Info {
  Info({
      this.count, 
      this.pages, 
      this.next, 
      this.prev,});

  Info.fromJson(dynamic json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }
  num? count;
  num? pages;
  String? next;
  dynamic prev;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['pages'] = pages;
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }

}

class Character {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,});

  Character.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }
  num? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;
}

class Location {
  Location({
    this.name,
    this.url,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}

class Origin {
  Origin({
    this.name,
    this.url,});

  Origin.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}