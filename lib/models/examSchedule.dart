// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ExamSchedule> schedulesFromJson(String str) => List<ExamSchedule>.from(json.decode(str).map((x) => ExamSchedule.fromJson(x)));

String schedulesToJson(List<ExamSchedule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExamSchedule {
    ExamSchedule({
        this.date,
        this.startTime,
        this.endTime,
        this.code,
        this.name,
        this.examType,
        this.year,
        this.month,
        this.scheRelease,
    });

    String date;
    String startTime;
    String endTime;
    int code;
    String name;
    ExamType examType;
    int year;
    int scheRelease;
    int month;

    factory ExamSchedule.fromJson(Map<String, dynamic> json){
    return
    ExamSchedule(
        date: json["date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        code: json["code"],
        name: json["name"],
        examType: examTypeValues.map[json["exam_type"]],
        year: json["year"],
        scheRelease: json["schedule_release"],
        month: json["month"],
    );
    }

    Map<String, dynamic> toJson() => {
        "date": date,
        "start_time": startTime,
        "end_time": endTime,
        "code": code,
        "name": nameValues.reverse[name],
        "exam_type": examTypeValues.reverse[examType],
        "year": year,
        "schedule_release":scheRelease,
        "month": month,
    };
}

enum ExamType { E_TEST, PRACTICAL }

final examTypeValues = EnumValues({
    "E-Test": ExamType.E_TEST,
    "Practical": ExamType.PRACTICAL
});

enum Name { ICT_APPLICATIONS, ENGLISH_FOR_ICT, MATHEMATICS_FOR_ICT }

final nameValues = EnumValues({
    "English for ICT": Name.ENGLISH_FOR_ICT,
    "ICT Applications": Name.ICT_APPLICATIONS,
    "Mathematics for ICT": Name.MATHEMATICS_FOR_ICT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

