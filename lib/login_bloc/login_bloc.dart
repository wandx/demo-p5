import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitForm>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));
      if(formKey.currentState!.validate()){
        if(email.text == 'coba@gmail.com' && password.text == 'password'){
          emit(LoginSuccess());
        }else{
          emit(LoginFailed());
        }
      }
    });
  }

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
}
