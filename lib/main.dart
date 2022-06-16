import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injector/injector.dart';
import 'package:k11/entities/user_list.dart';
import 'package:k11/home/bloc/home_bloc.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'package:k11/onboarding/onboarding_page.dart';
import 'package:k11/user-list/bloc/user_list_bloc.dart';
import 'package:k11/utils/injector.dart';
import 'package:k11/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(UserListAdapter());
  Dependencies().repositoryRegister();
  Dependencies().blocsRegister();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Injector.appInstance.get<HomeBloc>()),
        BlocProvider(create: (_) => Injector.appInstance.get<UserListBloc>())
      ],
      child: MaterialApp(
        title: 'Cart',
        debugShowCheckedModeBanner: false,
        home: const OnboardingPage(),
        routes: MyRoutes.routes,
      ),
    );
  }
}
