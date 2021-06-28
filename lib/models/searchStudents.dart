

import 'dart:convert';

List<StudentsSearch> searchStudnetFromJson(String str) => List<StudentsSearch>.from(json.decode(str).map((x) => StudentsSearch.fromJson(x)));

String searchtStudentToJson(List<StudentsSearch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class StudentsSearch{

     
      StudentsSearch({
       
        this.id,
        this.regNo,
        this.userId,
        this.firstName,
        this.middleName,
        this.lastName,
        this.fullName,
        this.gender,
        this.nic,
        this.cityShip,
        this.dob,
        this.regYear,
        this.education,
        this.perHouseNo,
        this.perHouseAddline1,
        this.perHouseAddline2,
        this.perHouseAddline3,
        this.perHouseAddline4,
        this.telephonecode,
        this.telephone,
        this.bitE,
        this.fitCert,

      });
      int id;
      String regNo;
      int userId;
      String firstName;
      String middleName;
      String lastName;
      String fullName;
      String gender;
      String nic;
      String cityShip;
      String dob;
      int regYear;
      String education;
      String perHouseNo;
      String perHouseAddline1;
      String perHouseAddline2;
      String perHouseAddline3;
      String perHouseAddline4;
      int telephonecode;
      int telephone;
      int bitE;
      int fitCert;
  factory StudentsSearch.fromJson(Map<String, dynamic> json){
  
    return
    StudentsSearch(
       id:json['id'],
       regNo:json['reg_no'],
       userId: json['user_id'],
       firstName:json['first_name'],
       middleName:json['middle_names'],
       lastName:json['last_name'],
       fullName:json['full_name'],
       gender:json['gender'],
       nic:json['nic_new'].toString(),
       cityShip:json['citizenship'],
       dob:json['dob'],
       regYear:json['reg_year'],
       education: json['education'],
       perHouseNo: json['permanent_house'],
       perHouseAddline1: json['permanent_address_line1'],
       perHouseAddline2: json['permanent_address_line2'],
       perHouseAddline3: json['permanent_address_line3'],
       perHouseAddline4: json['permanent_address_line4'],
       telephonecode:json['telephone_country_code'],
       telephone: json['telephone'],
       bitE:json['bit_eligible'],
       fitCert: json['fit_cert']
    );
    }

    Map<String, dynamic> toJson() => {
       'id':id,
       'reg_no':regNo,
       'user_id':userId,
       'first_name':firstName,
       'middle_names':middleName,
       'last_name':lastName,
       'full_name':fullName,
       'gender':gender,
       'nic_new':nic,
       'cityzenship':cityShip,
       'dob':dob,
       'reg_year':regYear,
       'education':education,
       'permanent_house':perHouseNo,
       'permanent_address_line1':perHouseAddline1,
       'permanent_address_line2':perHouseAddline2,
       'permanent_address_line3':perHouseAddline3,
       'permanent_address_line4':perHouseAddline4,
       'telephone_country_code':telephonecode,
       'telephone':telephone,
       'bit_eligible':bitE,
       'fit_cert':fitCert,
    };

}