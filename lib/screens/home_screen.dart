import 'dart:io';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/controller/tasks_states.dart';
import 'package:tasks_app/core/utils/app_color.dart';
import '../components/bottom_sheet_component.dart';
import '../components/image_component.dart';
import '../components/task_component.dart';
import '../controller/tasks_cubit.dart';
import '../functions/flutter_local_notifications_functions.dart';
import '../main.dart';
import '../models/task_model.dart';
import 'add_task_screen.dart';
class HomeScreen extends StatelessWidget {
  List<Map<String,dynamic>>list=[];
  XFile? img;
  DateTime?date;
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<TasksCubit, TasksStates>(
  builder: (context, state) {
   list= context.read<TasksCubit>().getTask(date: DateTime.now());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              MyApp.of(context).changeMode();
            },
            child:Icon(MyApp.of(context).isMode?Icons.dark_mode_outlined:Icons.sunny)) ,
        actions: [
     ImageComponent(widget: ClipRRect(borderRadius: BorderRadius.circular(40),
              child: img==null?Icon(Icons.person,):
              Image.file(File(img!.path))), height: 60, width: 60
            , onTap: ()async {
             img= await context.read<TasksCubit>().selectImage();
              img= await ImagePicker().pickImage(source: ImageSource.gallery);
            },),
          SizedBox(width: 10,)
        ],
          ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:  [
    const SizedBox(height: 10,),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),style: const TextStyle(
                color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 21
              ),),
              const SizedBox(height: 5,),
               Text('Today',style: Theme.of(context).textTheme.bodyMedium),
             const SizedBox(height: 8,)
            ],
          ),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
          }, child: Text('+ Add Task')
            ,)
        ],
    ),
    SizedBox(height: 15,),
    DatePicker(
    DateTime.now(),
    initialSelectedDate: DateTime.now(),
    selectionColor: Theme.of(context).primaryColor,
          dateTextStyle: const TextStyle( color: AppColor.greyColor,),
        dayTextStyle: const TextStyle( color: AppColor.greyColor ,),
        monthTextStyle: const TextStyle( color: AppColor.greyColor ),
        onDateChange: (dateTime) {
              date =dateTime;
         list=context.read<TasksCubit>().getTask(date: dateTime);
    },
    height: 90,
    ),
          SizedBox(height: 30,),
          list.isEmpty?
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    Image(image: AssetImage('lib/images/todo.png',),
                      width: 150,
                      height: 150,),
                    Text('You don\'t have any tasks yet!'
                      , style: Theme.of(context).textTheme.bodySmall
                      ,),
                    Text('Add new tasks to make your days productive'
                        ,style: Theme.of(context).textTheme.bodySmall
                      ,),
                    SizedBox(height: 20,)
                  ],
                ),
              ):Expanded(
        child:
        ListView.separated(
                itemBuilder: (context, index) {
    return TaskComponent(
                    onTap: (){
                      showModalBottomSheet(context: context
                          ,builder: (context) {
                            if (list[index]['checkTask'] == 'Completed') {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BottomSheetComponent(
                                      text: 'Delete Task',
                                      color: AppColor.redColor,
                                      onTap: () {
                                        context.read<TasksCubit>()
                                            .deleteTask(taskKey: list[index]['key']);
                                      }),
                                  SizedBox(height: 10,),
                                  BottomSheetComponent(
                                    text: 'Close',
                                    color: AppColor.whiteColor
                                    , onTap: () {
                                      Navigator.pop(context);
                                    },)
                                ],
                              );
                            } else {
                              return Container(
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BottomSheetComponent(
                                        text: 'Task Completed'
                                        , color: Theme.of(context).primaryColor,
                                        onTap: () {
                                          list[index]['checkTask']= 'Completed';
                                          context.read<TasksCubit>().getTask(date: date!);
                                        }
                                    ),
                                    SizedBox(height: 5,),
                                    BottomSheetComponent(
                                        text: 'Delete Task'
                                        , color: AppColor.redColor,
                                        onTap: () {
                                          context.read<TasksCubit>()
                                              .deleteTask(taskKey: list[index]['key']);
                                        }),
                                    SizedBox(height: 25,),
                                    BottomSheetComponent(text: 'Close',
                                      color: AppColor.whiteColor
                                      , onTap: () {
                                        Navigator.pop(context);
                                      },)
                                  ],
                                ),
                              );
                            }
                          }
                      );
                    }, task: Task(
                        list[index]['title']
                        , list[index]['note']
                        , list[index]['startTime']
                        , list[index]['endTime']
                        , Color(int.parse(list[index]['color'], radix: 16))
                        , list[index]['checkTask']
                    ),
                  );
                }, separatorBuilder: (context, index) {
              return SizedBox(height: 10,);
            }, itemCount: list.length
            ),
        )
          ],
        ),
      ),
    );
 },
);
  }
}
