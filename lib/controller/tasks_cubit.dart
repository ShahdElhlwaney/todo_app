






import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'tasks_states.dart';

class TasksCubit extends Cubit<TasksStates>{
  TasksCubit():super(InitialState());
  TasksCubit get(context)=>BlocProvider.of(context);
  final taskRef=Hive.box('ToDo_App');

  ///
  ///
  void addTask({required String title,required String startTime
    ,required String endTime,required String note,required DateTime date,required Color color})async{
    emit(AddTaskLoading());
    try{
      await taskRef.add({
        'title': title ,
        'startTime': startTime ,
        'endTime':   endTime,
        'note':note,
        'date':date,
        'color':color.toString().split('(0x')[1].split(')')[0],
        'checkTask':'ToDo'
      });
      emit(AddTaskSuccess());
      print('shahoda');
      print(date.toString());
    }catch(e){
      emit(AddTaskError());
      print('Error');
    }
  }
  List<Map<String,dynamic>> getTask({required DateTime date}) {
    List<Map<String,dynamic>> list=[];

   try {
     final keys = taskRef.keys;
     for (final key in keys) {
       final task = taskRef.get(key);
       if (task['date'].isBefore(date)) {
         final maptask = {
           'key': key,
           'title': task['title'],
           'startTime': task['startTime'],
           'endTime': task['endTime'],
           'note': task['note'],
           'color': task['color'],
           'checkTask': task['checkTask']
         };
         list.add(maptask);

         print(list[0]);
       } else if (task['date'].isAfter(date)) {}
       else {
         final maptask = {
           'key': key,
           'title': task['title'],
           'startTime': task['startTime'],
           'endTime': task['endTime'],
           'note': task['note'],
           'color': task['color'],
           'checkTask': task['checkTask']
         };
         list.add(maptask);
       }
     }
     emit(GetTaskSuccess());
   }catch(e){
     print('Error');
     emit(GetTaskError());
   }


return list;
  }
    void deleteTask({required int taskKey})async{
      await taskRef.delete(taskKey);
      print('delete');
      emit(DeleteTaskSuccess());
    }
  final imagePicer=ImagePicker();


  Future<XFile?>selectImage()async{
    XFile? pickedFile=await imagePicer.pickImage(source: ImageSource.gallery);
    emit(SelectedImageSuccess());
    return pickedFile;


  }

}