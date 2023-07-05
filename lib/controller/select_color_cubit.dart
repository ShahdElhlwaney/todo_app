



import 'package:flutter_bloc/flutter_bloc.dart';

class SelectColorCubit extends Cubit<int>{
  SelectColorCubit():super(0);
  void selectColor({required int index}){
    emit(index);

  }

}