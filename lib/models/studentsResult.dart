
import 'dart:convert';

List<StudentResults> studnetResultFromJson(String str)
 => List<StudentResults>.from(json.decode(str).map((x) => StudentResults.fromJson(x)));

String searchtStudentToJson(List<StudentResults> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  
class StudentResults{

  StudentResults
  ({
    this.name,
    this.code,
    this.result,
    this.mark,
    this.date,       
  });
  
    String name;
    int code;
    int result;
    String mark;
    String date;

    factory StudentResults.fromJson(Map<String,dynamic> json){
       
        return 
          StudentResults
          (
                name:json['name'],
                code:json['code'],
                result:json['result'],
                mark:json['mark'],
                date:json['date'],
          );
    }

  Map<String,dynamic> toJson()=>{
    'name':name,
    'code':code,
    'result':result,
    'mark':mark,
    'date':date,
  };

}