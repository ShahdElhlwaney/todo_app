import 'package:flutter/material.dart';
import '../core/utils/app_color.dart';
import '../models/task_model.dart';
class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key, required this.task, required this.onTap});
  final Task task;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)
                , bottomRight: Radius.circular(20)
                , bottomLeft: Radius.circular(20)),
            color: task.color
        ),
        padding: EdgeInsets.all(15),
        height: 120,
        width: 400,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(5, 8, 9),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(task.title!, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                  Row(children: [
                    const Icon(Icons.access_time_outlined,
                      color: AppColor.greyColor,),
                    Text(task.startTime! + '-'
                        , style: Theme.of(context).textTheme.bodySmall
                    ),
                    Text(task.endTime!
                      , style: Theme.of(context).textTheme.bodySmall,),
                  ],),
                  Text(task.note!, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.greyColor
                  ),),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                    child: VerticalDivider(
                      thickness: 2,
                      color: AppColor.greyColor,
                      width: 1,
                    ),
                  ),
                  SizedBox(width: 10,),
                  RotatedBox(
                    quarterTurns: 3, //'TODO'
                    child:
                    Text(task.checkTask!, style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  )
                ],
              ),
            ]) ,


      )



     /* Container(
        padding: EdgeInsets.all(15),
        height: 120,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)
                , bottomRight: Radius.circular(20)
                , bottomLeft: Radius.circular(20)),
            color: task.color
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(task.title!, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                  Row(children: [
                    const Icon(Icons.access_time_outlined,
                      color: AppColor.greyColor,),
                    Text(task.startTime! + '-'
                        , style: Theme.of(context).textTheme.bodySmall
                  ),
                    Text(task.endTime!
                      , style: Theme.of(context).textTheme.bodySmall,),
                  ],),
                  Text(task.note!, style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.greyColor
                  ),),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 70,
                    child: VerticalDivider(
                      thickness: 2,
                      color: AppColor.greyColor,
                      width: 1,
                    ),
                  ),
                  SizedBox(width: 10,),
                  RotatedBox(
                    quarterTurns: 3, //'TODO'
                    child:
                    Text(task.checkTask!, style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  )
                ],
              ),
            ]),
      ),*/
    );
  }
}
