import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_with_bloc/repositories/auth_repositories.dart';

part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  final AuthRepositories authRepositories;
  HospitalListBloc({required this.authRepositories})
      : super(HospitalListState.intial()) {
    on<LoadMaritalStatusEvent>((event, emit) async {
      emit(state.copyWith(maritalListStatus: MaritalListStatus.loading));
      try {
        final maritalDataList = await authRepositories.maritalStatusList();
        emit(state.copyWith(
            maritalListStatus: MaritalListStatus.loaded,
            maritalList: maritalDataList));
      }  catch (e) {
        emit(state.copyWith(
          maritalListStatus: MaritalListStatus.error,
        ));
      }
    });
  }
}
