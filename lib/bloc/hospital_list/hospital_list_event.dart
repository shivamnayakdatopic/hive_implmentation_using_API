// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'hospital_list_bloc.dart';

abstract class HospitalListEvent extends Equatable {
  const HospitalListEvent();

  @override
  List<Object> get props => [];
}


class LoadMaritalStatusEvent extends HospitalListEvent{}
