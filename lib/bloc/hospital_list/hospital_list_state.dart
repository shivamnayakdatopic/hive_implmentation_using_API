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


  static HospitalListState fromJson(Map<String, dynamic> json) {
    final maritalList = (json['maritalList'] as List<dynamic>?)
        ?.map((e) => FamilyStatus.fromJson(e as Map<String, dynamic>))
        .toList();

    return HospitalListState(
      maritalListStatus:
          MaritalListStatus.values[json['maritalListStatus'] as int],
      maritalList: maritalList as List,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final jsonList = maritalList.map((e) => e.toJson()).toList();

    return {
      'maritalListStatus': maritalListStatus.index,
      'maritalList': jsonList,
    };
  }
}
