import 'package:MobileProject/componet/activityInticator.dart';
import 'package:MobileProject/componet/appBarComponet.dart';
import 'package:MobileProject/componet/drawerComponet.dart';
import 'package:MobileProject/controllers/examSchedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  List<Meeting> meetings;
  ExamScheduleController examscheduleController=Get.put(ExamScheduleController());
  @override
  Widget build(BuildContext context) {
   
    Size size=MediaQuery.of(context).size;
    return 
      Obx(()=>examscheduleController.isLoading.value==false?
   Center():
       Column(
        children: [
        
          RefreshIndicator(
            onRefresh: ()async{
              
                   await Future.delayed(Duration(seconds: 2));
                         SharedPreferences prefs = await SharedPreferences.getInstance();
                  var token = prefs.getString('token');
                  print(token);
                 
                  examscheduleController.fetchExamSchedule();
                  
            },
                      child: Card(
                                              child: Container(
                        decoration: BoxDecoration(
                                border: Border.all(
                             color: Colors.black,
                                ),
                               ),
                        child:examscheduleController.examScheduleList==null?Center(child: Text("not schedules"),): Container(
                  height:size.height*3/4,
                  width: double.infinity,
                  child: SfCalendar(
                    viewHeaderHeight:50,
                    headerHeight: 50,
                    viewHeaderStyle:ViewHeaderStyle(
                        backgroundColor: Color.fromRGBO(15, 61, 84,1),
                        dateTextStyle: TextStyle(color: Colors.white),
                        dayTextStyle: TextStyle(color: Colors.white)
                        ),
                    headerStyle:CalendarHeaderStyle(
                        backgroundColor: Color.fromRGBO(15, 61, 84,1),
                        textAlign:TextAlign.center,
                        textStyle: TextStyle(color: Colors.white)
                        ),
            view: CalendarView.month ,
            todayHighlightColor: Colors.deepOrange,
            dataSource: MeetingDataSource(_getDataSource(examscheduleController.examScheduleList)),
            // by default the month appointment display mode set as Indicator, we can
            // change the display mode as appointment using the appointment display
            // mode property
            monthViewSettings: MonthViewSettings(
                showAgenda: true,
                    appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
    )),
             ),
                      ),
          ),
        ],
      ));
  }

  List<Meeting> _getDataSource(var list) {
  
     
    meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
     meetings.clear();
      for(int i=0; i<list.length; i++){
        
         
           meetings.insert(
                i,
             Meeting(
               list[i].scheRelease==0?
                '${list[i].name}  FIT${list[i].code }\t NOT RELEASE ':
                   '${list[i].name}  FIT${list[i].code }\t RELEASE ',
                  DateTime.parse('${list[i].date} ${list[i].startTime}'),
                  DateTime.parse('${list[i].date} ${list[i].endTime}'),
                 list[i].scheRelease==0? Colors.red[300]:
                 DateTime.parse('${list[i].date} ${list[i].startTime}').isAfter(today) ?
                 Color.fromRGBO(0, 37, 255,1):Color.fromRGBO(25, 120, 255,1), 
                 false,
             )
           );
           
       }
    
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}