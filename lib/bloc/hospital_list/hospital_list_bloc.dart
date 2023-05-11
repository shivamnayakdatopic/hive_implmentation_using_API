import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_with_bloc/model/marital_list.dart';
import 'package:hive_with_bloc/repositories/auth_repositories.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends HydratedBloc<HospitalListEvent, HospitalListState> {
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
  
  @override
  HospitalListState fromJson(Map<String, dynamic> json) {
    try {
      return HospitalListState.fromJson(json);
    } catch (_) {
      return HospitalListState.intial();
    }
  }
  
  @override
  Map<String, dynamic> toJson(HospitalListState state) {
    try {
      return state.toJson();
    } catch (e) {
      return {};
    }
  }
}