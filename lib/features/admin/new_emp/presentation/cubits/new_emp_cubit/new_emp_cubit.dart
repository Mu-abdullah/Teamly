import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_emp_state.dart';

class NewEmpCubit extends Cubit<NewEmpState> {

  NewEmpCubit() : super(NewEmpInitial());
  
  static NewEmpCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();  
  var name = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var nid = TextEditingController();
  var startIn = TextEditingController();
  var salary = TextEditingController();
}
