



import 'dart:ui';

class Task{
   String? title;
   String? note;
   //String? date;
   String? startTime;
   String? endTime;
   Color? color;

  // int? remind;
   String? checkTask;

  Task( this.title, this.note,/* this.date*/ this.startTime, this.endTime
      , this.color, this.checkTask,/* this.repeat*/);

  Task.fromJson(Map<String,dynamic>json)
      {
         title=json['title'];
        note=json['note'];
        //date=json['date'];
        startTime=json['startTime'];
        endTime=json['endTime'];
        color=json['color'];
        checkTask=json['checkTask'];
      //  remind=json['remind'];
      //  repeat=json['repeat'];

      }
}