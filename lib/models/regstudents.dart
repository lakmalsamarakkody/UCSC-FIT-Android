import 'dart:convert';
List<RegStudent> regStudentFromJson(String str)
 => List<RegStudent>.from(json.decode(str).map((x) => RegStudent.fromJson(x)));

String regStudentToJson(List<RegStudent>  data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Data> dataFromJson(String str)
 => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));
class RegStudent {
   RegStudent ({
        this.yearReg,
        this.data,
    });

    int yearReg;
    var data;

    factory RegStudent .fromJson(Map<String, dynamic> json) => RegStudent (
        yearReg: json["yearReg"] == null ? null : json["yearReg"],
        data: dataFromJson(json['Data']),
    );

    Map<String, dynamic> toJson() => {
        "yearReg": yearReg == null ? null : yearReg,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.regYear,
        this.firstName,
        this.updatedAt,
    });

    int regYear;
    String firstName;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        regYear: json["reg_year"],
        firstName: json["first_name"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "reg_year": regYear,
        "first_name": firstName,
        "updated_at": updatedAt.toIso8601String(),
    };
}
