



import 'dart:convert';

List<ResultOverviewModel> resultFromJson(String str) => List<ResultOverviewModel>.from(json.decode(str).map((x) => ResultOverviewModel.fromJson(x)));

String resultToJson(List<ResultOverviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResultOverviewModel {
  ResultOverviewModel({
        this.notAb,
        this.regStu,
        this.pass,
        this.ab,
        this.fail,
        this.details,
    });

    int notAb;
    int regStu;
    int pass;
    int ab;
    int fail;
    Details details;

    factory ResultOverviewModel.fromJson(Map<String, dynamic> json) => ResultOverviewModel(
        notAb: json["NotAB"],
        regStu: json["RegStu"],
        pass: json["Pass"],
        fail:json['NotAB']-json['Pass'],
        ab:json["RegStu"]-json["NotAB"],
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "NotAB": notAb,
        "RegStu": regStu,
        "Pass": pass,
        "details": details.toJson(),
    };
}

class Details {
    Details({
        this.name,
        this.code,
        this.id,
        this.year,
        this.isnull
    });

    String name;
    int code;
    int id;
    int year;
    bool isnull;
  

    factory Details.fromJson(Map<String, dynamic> json)
    {
      if(json==null){
        return
         Details
        (
          name:'not name',
          code:0,
          id:0,
          year:0,
          isnull:true,
        );
      }
      return
      Details(
        name: json["name"]==null?'no name':json["name"],
        code: json["code"]==null?'no code':json['code'],
        id:json['id']==null?'no id':json['id'],
        year:json['year']==null?'no year':json['year'],
        isnull: false,
    );
    }
    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "id":id,
        "year":year,
    };
}
