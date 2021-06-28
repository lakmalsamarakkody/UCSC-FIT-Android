// To parse this JSON data, do
//
//     final sheduleId = sheduleIdFromJson(jsonString);

import 'dart:convert';

List<SheduleId> sheduleIdFromJson(String str) => List<SheduleId>.from(json.decode(str).map((x) => SheduleId.fromJson(x)));

String sheduleIdToJson(List<SheduleId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SheduleId {
    SheduleId({
        this.name,
        this.code,
        this.date,
        this.year,
        this.month,
        this.id,
        this.selected,
    });

    String name;
    int code;
    DateTime date;
    int year;
    int month;
    int id;
    bool selected;

    factory SheduleId.fromJson(Map<String, dynamic> json) => SheduleId(
        name: json["name"],
        code: json["code"],
        date: DateTime.parse(json["date"]),
        year: json["year"],
        month: json["month"],
        id: json["id"],
        selected: false,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "year": year,
        "month": month,
        "id": id,
    };
}
