import 'dart:convert';

ActiveStudent activeFromJson(String str) => ActiveStudent.fromJson(json.decode(str));

String activeToJson(ActiveStudent data) => json.encode(data.toJson());

class ActiveStudent {
    ActiveStudent({
        this.yearReg,
        this.pendiig,
        this.active,
        this.accActive,
        this.updated
    });

    double yearReg;
    double pendiig;
    double active;
    double accActive;
    UpdateDate updated;

    factory ActiveStudent.fromJson(Map<String, dynamic> json) => ActiveStudent(
        yearReg: json["yearReg"].toDouble(),
        pendiig:(json['active']==json['accActive'])?0: (json["yearReg"]-json["active"]).toDouble(),
        active: json["active"].toDouble(),
        accActive:json['accActive'].toDouble(),
        updated:UpdateDate.fromJson(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "yearReg": yearReg,
        "Pendiig": pendiig,
        "active": active,
        "updateDate":updated.toJson(),
    };
}

class UpdateDate {
    UpdateDate({
        this.updatedAt,
    });

   String updatedAt;

    factory UpdateDate.fromJson(Map<String, dynamic> json) => UpdateDate(
        updatedAt:json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "updated_at": updatedAt
    };
}