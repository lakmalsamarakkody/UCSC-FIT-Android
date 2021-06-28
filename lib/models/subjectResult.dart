
import 'dart:convert';

List<SubjectResult> subjectResultFromJson(String str) => List<SubjectResult>.from(json.decode(str).map((x) => SubjectResult.fromJson(x)));

String subjectResultToJson(List<SubjectResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectResult {
    SubjectResult({
        this.sheduleId,
        this.notAb,
        this.regStu,
        this.pass,
        this.fail,
        this.aB,
        this.type
    });

    int sheduleId;
    int notAb;
    int aB;
    int regStu;
    int pass;
    int fail;
    String type;

    factory SubjectResult.fromJson(Map<String, dynamic> json) => SubjectResult(
        sheduleId: json["Shedule ID"],
        aB:json["RegStu"]-json["NotAB"],
        notAb:json["NotAB"],
        regStu: json["RegStu"],
        pass: json["Pass"],
        fail: json["NotAB"]-json["Pass"],
        type:json['typeName'],
    );

    Map<String, dynamic> toJson() => {
        "Shedule ID": sheduleId,
        "NotAB": notAb,
        "RegStu": regStu,
        "Pass": pass,
        "fail": fail,
        "typeName":type,
    };
}
