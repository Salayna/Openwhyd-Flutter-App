// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.fbId,
    this.handle,
    this.pub,
    this.img,
    this.n,
    this.name,
    this.lnk,
    this.loc,
    this.bio,
    this.pl,
    this.cvrImg,
    this.welcomeId,
    this.mid,
    this.onb,
    this.consent,
  });

  String id;
  String fbId;
  String handle;
  int pub;
  String img;
  String n;
  String name;
  Lnk lnk;
  String loc;
  String bio;
  List<Pl> pl;
  String cvrImg;
  String welcomeId;
  String mid;
  Onb onb;
  Consent consent;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    fbId: json["fbId"],
    handle: json["handle"],
    pub: json["pub"],
    img: json["img"],
    n: json["n"],
    name: json["name"],
    lnk: Lnk.fromJson(json["lnk"]),
    loc: json["loc"],
    bio: json["bio"],
    pl: List<Pl>.from(json["pl"].map((x) => Pl.fromJson(x))),
    cvrImg: json["cvrImg"],
    welcomeId: json["id"],
    mid: json["mid"],
    onb: Onb.fromJson(json["onb"]),
    consent: Consent.fromJson(json["consent"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fbId": fbId,
    "handle": handle,
    "pub": pub,
    "img": img,
    "n": n,
    "name": name,
    "lnk": lnk.toJson(),
    "loc": loc,
    "bio": bio,
    "pl": List<dynamic>.from(pl.map((x) => x.toJson())),
    "cvrImg": cvrImg,
    "id": welcomeId,
    "mid": mid,
    "onb": onb.toJson(),
    "consent": consent.toJson(),
  };
}

class Consent {
  Consent({
    this.lang,
    this.date,
  });

  String lang;
  DateTime date;

  factory Consent.fromJson(Map<String, dynamic> json) => Consent(
    lang: json["lang"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "lang": lang,
    "date": date.toIso8601String(),
  };
}

class Lnk {
  Lnk({
    this.igrm,
    this.yt,
    this.sc,
    this.tw,
    this.fb,
    this.home,
  });

  String igrm;
  String yt;
  String sc;
  String tw;
  String fb;
  String home;

  factory Lnk.fromJson(Map<String, dynamic> json) => Lnk(
    igrm: json["igrm"],
    yt: json["yt"],
    sc: json["sc"],
    tw: json["tw"],
    fb: json["fb"],
    home: json["home"],
  );

  Map<String, dynamic> toJson() => {
    "igrm": igrm,
    "yt": yt,
    "sc": sc,
    "tw": tw,
    "fb": fb,
    "home": home,
  };
}

class Onb {
  Onb({
    this.tags,
  });

  List<String> tags;

  factory Onb.fromJson(Map<String, dynamic> json) => Onb(
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}

class Pl {
  Pl({
    this.id,
    this.name,
    this.url,
    this.nbTracks,
  });

  dynamic id;
  String name;
  String url;
  int nbTracks;

  factory Pl.fromJson(Map<String, dynamic> json) => Pl(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    nbTracks: json["nbTracks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "nbTracks": nbTracks,
  };
}
