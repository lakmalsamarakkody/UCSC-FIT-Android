

import 'dart:convert';

List<CurrentExam> currentexamFromJson(String str) => List<CurrentExam>.from(json.decode(str).map((x) => CurrentExam.fromJson(x)));

String currentexamToJson(List<CurrentExam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentExam {
   CurrentExam({
        this.notAb,
        this.regStu,
        this.details,
        this.abstu,
      
    });

    double notAb;
    double regStu;
    double abstu;
    Details details;
 

    factory CurrentExam.fromJson(Map<String, dynamic> json) =>CurrentExam(
        notAb: json["NotAB"].toDouble(),
        regStu: json["RegStu"].toDouble(),
        abstu: json["RegStu"].toDouble()-json["NotAB"].toDouble(),
        details: Details.fromJson(json["details"]),
      
    );

    Map<String, dynamic> toJson() => {
        "NotAB": notAb,
        "RegStu": regStu,
        "details": details.toJson(),
    };
}

class Details {
    Details({
        this.name,
        this.code,
        this.id,
        this.year,
        this.date,
        this.update,
    });

    String name;
    int code;
    int id;
    int year;
    String date;
    String update;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        name: json["name"],
        code: json["code"],
        id: json["id"],
        year: json["year"],
        date:json["date"],
        update:json["updated_at"]==null?'not date':json["updated_at"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "id": id,
        "year": year,
        "updated_at":update,
        'date':date,
    };
}

