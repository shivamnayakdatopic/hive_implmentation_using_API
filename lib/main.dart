import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_with_bloc/bloc/hospital_list/hospital_list_bloc.dart';
import 'package:hive_with_bloc/model/marital_list.dart';
import 'package:hive_with_bloc/repositories/auth_repositories.dart';
import 'package:hive_with_bloc/screens/home_page.dart';
import 'package:hive_with_bloc/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize hive database.
  await Hive.initFlutter();
  // Register the adapter for the FamilyStatus model.We have to register.
  Hive.registerAdapter(FamilyStatusAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositories(authServices: AuthServices()),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HospitalListBloc(
                  authRepositories: context.read<AuthRepositories>()),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            home: const MyHomePage(title: 'Hive with Bloc'),
          )),
    );
  }
}
