import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks_app/controller/tasks_cubit.dart';
import 'package:tasks_app/controller/select_color_cubit.dart';
import 'package:tasks_app/screens/home_screen.dart';
import 'core/theme/dark&light_theme.dart';
import 'functions/flutter_local_notifications_functions.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('ToDo_App');
 // LocalNotificationService().intialize();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}
class _MyAppState extends State<MyApp> {
  bool isMode=true;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectColorCubit>(create:(context)=>SelectColorCubit()),
        BlocProvider<TasksCubit>(create:(context)=>TasksCubit()),
      ],
      child: MaterialApp(
          title: 'ToDo_App',
          theme:isMode?lightTheme():darkTheme(),
          home:   HomeScreen()
      ),
    );
  }
  void changeMode(){
    setState(() {
      isMode=!isMode;
    });
  }
}

