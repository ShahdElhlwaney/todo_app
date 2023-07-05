import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/controller/select_color_cubit.dart';
import 'package:tasks_app/controller/tasks_cubit.dart';
import 'package:tasks_app/controller/tasks_states.dart';
import '../components/remind&repeat_component.dart';
import '../components/textfield_component.dart';
import '../core/utils/app_color.dart';
import '../core/utils/consts.dart';
import '../functions/flutter_local_notifications_functions.dart';
import '../functions/flutter_toast_function.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController title=TextEditingController();
  TextEditingController note=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController startTime=TextEditingController();
  TextEditingController endTime=TextEditingController();
  TextEditingController remindController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  String?dropdownRemind;
  String?dropdownRepeat;
  DateTime?dateTime;
  int? minute,hour;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksStates>(
    listener: (context, state) {
      if(state is AddTaskLoading){
        const CircularProgressIndicator();
      }
      else if(state is AddTaskSuccess){
     showToast(message: 'You Add your Task Successfully', color: AppColor.greenColor);
      }else if(state is AddTaskError){
        showToast(message: 'Failure', color: AppColor.redColor);
      }
    },
    builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor,)),
          ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                 Text('Add Task',style: Theme.of(context).textTheme.bodyLarge,),
                SizedBox(height: 15,),
                 Text('Title',style:  Theme.of(context).textTheme.bodyMedium,),
                const SizedBox(height: 8,),
                TextFieldComponent(hintText: 'Enter title here', textEditingController: title,),
                const SizedBox(height: 15,),
                Text('Note',style:Theme.of(context).textTheme.bodyMedium ,),
                SizedBox(height: 8,),
                TextFieldComponent(hintText: 'Enter note here', textEditingController: note,),
                const SizedBox(height: 15,),
                 Text('Date',style:Theme.of(context).textTheme.bodyMedium,),
                const SizedBox(height: 8,),
                 TextFieldComponent(
                   onTap: (){
                     showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime.now()
                         , lastDate: DateTime(2090)).then((value) {
                       dateTime=value;
                       date.text = DateFormat.yMMMMd().format(value!).toString();
                     });
                   },
                   hintText: 'Enter date here', suffex:Icon( Icons.calendar_month), textEditingController: date,),
                const SizedBox(height: 15,),
                Row(
                 children: [
                   Expanded(
                     child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start   ,
                       children:  [
                         Text('Start Time',style:Theme.of(context).textTheme.bodyMedium,),
                          SizedBox(height: 5,),
                          TextFieldComponent(hintText: 'Enter start time here', suffex: Icon(Icons.access_time_outlined),
                            textEditingController: startTime,
                            onTap: (){
                            showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                                startTime.text=value!.format(context);
                                 minute=value.minute;
                                 hour=value.hour;
                            });
                            },
                          ),
                       ],
                     ),
                   ) ,
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('End Time',style:Theme.of(context).textTheme.bodyMedium,),
                          SizedBox(height: 5,),
                          TextFieldComponent(
                            onTap: (){
                              showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                                endTime.text=value!.format(context);
                             });
                            },
                            hintText: 'Enter end time here'
                            , suffex: Icon(Icons.access_time_outlined)
                            , textEditingController: endTime,
                          ),
                        ],
                      ),
                    ) ,
                  ],
                ),
                SizedBox(height: 10,),
                Text('Remind', style:Theme.of(context).textTheme.bodyMedium,),
                SizedBox(height: 10,),
                RemindRepeatComponent(hintText: 'Time before the task', onChanged: (String?value){
              dropdownRemind=value;
              remindController.text='$dropdownRemind minutes early';
            }, controller: remindController, iteamsList:remindList,),
            SizedBox(height: 10,),
            Text('Repeat',style:Theme.of(context).textTheme.bodyMedium ,),
            SizedBox(height: 10,),
            RemindRepeatComponent(hintText: ''
                , onChanged: (String?value){
                  dropdownRepeat=value;
                  repeatController.text=dropdownRepeat!;
                }, controller: repeatController, iteamsList: repeatList,),
                const SizedBox(height: 20,),
                 BlocBuilder<SelectColorCubit, int>(
                   builder: (context, state) {
                   return Row(
                    children:  [
                    Expanded(
                      child:Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Text('Color',
                                 style: TextStyle(color: AppColor.blackColor
                                     , fontWeight: FontWeight.bold,
                                     fontSize: 18),),
                               const SizedBox(height: 8,),
                               Wrap(
                                   children:
                                   List.generate(3, (index) {
                                     return GestureDetector(
                                         onTap: () {
                                           context.read<SelectColorCubit>()
                                               .selectColor(index: index);
                                         },
                                         child: Padding(
                                           padding: const EdgeInsets.only(
                                               right: 5),
                                           child: CircleAvatar(
                                               backgroundColor: index == 0 ? Theme
                                                   .of(context)
                                                   .primaryColor : index == 1 ?
                                               AppColor.redColor : AppColor
                                                   .orangeColor,
                                               child: state == index
                                                   ? Icon(Icons.check,
                                                 color: AppColor.whiteColor,)
                                                   : Container()
                                           ),
                                         )
                                     );
                                   })
                               )
                             ]
                         ),
                     ), TextButton(onPressed: (){
                        context.read<TasksCubit>().addTask(title: title.text
                            , startTime: startTime.text, endTime: endTime.text
                            , note: note.text, date: dateTime!
                            , color: state==0?
                            Theme.of(context).primaryColor:state==1?
                            AppColor.redColor:AppColor.orangeColor);
                        LocalNotificationService().createNotifications();

                      }, child: Text('Create Task'))
      ]
                   );
    }
    )
          ]

                    ),
                ),
                  ),
      );
    },
);
  }
}


/*hour: hour!
, minute:dropdownRemind=='5'? minute!-5
:dropdownRemind=='10'? minute!-10
:dropdownRemind=='15'? minute!-15: minute!-20
, numOfDays:dropdownRepeat=='None'?0
:dropdownRepeat=='Daily'?1
:dropdownRepeat=='Weekly'?7
:30
*/
