

import 'dart:convert';

List<SubjectDetailsModel> subjectFromJson(String str)=>
                          List<SubjectDetailsModel>.from(json.decode(str).map((x)=>SubjectDetailsModel.fromJson(x)));
String subjectToJson(List<SubjectDetailsModel>data)=>
                      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class SubjectDetailsModel{
   
     SubjectDetailsModel({
       this.id,
       this.name,
       this.code,
     });
    
   int id;
   String name;
   int code;
  

  factory SubjectDetailsModel.fromJson(Map<String,dynamic> json){

    return 
     SubjectDetailsModel(
       id:json['id'],
       name:json['name'],
       code:json['code'],
     );
  }
  Map<String, dynamic> toJson()=>{

      'id':id,
      'name':name,
      'code':code,

  };
}