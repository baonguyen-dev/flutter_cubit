import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubits/app_cubits_state.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit(): super(InitialState()) {
    emit(WelcomeState());
  }
}