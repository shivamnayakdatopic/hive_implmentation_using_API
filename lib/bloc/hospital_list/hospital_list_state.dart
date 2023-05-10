// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'hospital_list_bloc.dart';

enum MaritalListStatus { intial, loading, loaded, error }

class HospitalListState extends Equatable {
  final List maritalList;
  final MaritalListStatus maritalListStatus;
  const HospitalListState({
    required this.maritalList,
    required this.maritalListStatus,
  });

  factory HospitalListState.intial() {
    return HospitalListState(
      maritalList: [],
      maritalListStatus: MaritalListStatus.intial,
    );
  }
  @override
  String toString() =>
      'HospitalListState( maritalList: $maritalList, maritalListStatus:$maritalListStatus,)';

  @override
  List<Object> get props => [
        maritalList,
        maritalListStatus,
      ];

  HospitalListState copyWith({
    List? maritalList,
    MaritalListStatus? maritalListStatus,
  }) {
    return HospitalListState(
      maritalList: maritalList ?? this.maritalList,
      maritalListStatus: maritalListStatus ?? this.maritalListStatus,
    );
  }
}
