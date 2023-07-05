


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/select_color_cubit.dart';
import '../core/utils/app_color.dart';
class ColorComponents extends StatelessWidget {
   ColorComponents({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectColorCubit, int>(
      builder: (context, state) {
        return Wrap(
            children:
            List.generate(3, (index) {
              return GestureDetector(
                  onTap: () {
                   context.read<SelectColorCubit>().selectColor(index: index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                        backgroundColor: index == 0 ? Theme
                            .of(context)
                            .primaryColor : index == 1 ?
                        AppColor.redColor : AppColor.orangeColor,
                        child: state == index
                            ? Icon(Icons.check, color: AppColor.whiteColor,)
                            : Container()
                    ),
                  )
              );
            })
        );
      },
    );
  }
}
