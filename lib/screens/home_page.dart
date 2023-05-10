import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_with_bloc/bloc/hospital_list/hospital_list_bloc.dart';
import 'package:hive_with_bloc/model/marital_list.dart';
import 'package:hive_with_bloc/services/auth_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FamilyStatus status = FamilyStatus();

  @override
  void initState() {
    context.read<HospitalListBloc>().add(LoadMaritalStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<HospitalListBloc, HospitalListState>(
          builder: (context, state) {
            if (state.maritalListStatus == MaritalListStatus.error) {
              return Text('Failed to load family status list');
            } else if (state.maritalListStatus == MaritalListStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final maritalList = state.maritalList;

              return ListView.builder(
                itemCount: maritalList.length,
                itemBuilder: (context, index) {
                  final familyStatus = maritalList[index];
                  return ListTile(
                    title: Text(familyStatus.value),
                    subtitle: Text(familyStatus.labelType),
                    trailing: Text(familyStatus.id.toString()),
                  );
                },
              );
            }
          },
        ));
  }
}
