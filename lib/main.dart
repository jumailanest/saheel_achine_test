import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saheel_machine_test/bloc/banner_bloc.dart';
import 'package:saheel_machine_test/bloc/search_bloc.dart';
import 'package:saheel_machine_test/bloc/sub_category_bloc.dart';
import 'package:saheel_machine_test/repository/banner_repository.dart';
import 'package:saheel_machine_test/repository/search_repository.dart';
import 'package:saheel_machine_test/repository/subcategory_repository.dart';
import 'package:saheel_machine_test/routes/routes.dart';
import 'package:saheel_machine_test/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BannerBloc(BannerRepository())),
        BlocProvider(create: (context) => SubcategoryBloc(SubcategoryRepository())),
        BlocProvider(create: (context) => SearchBloc(SearchRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.appThemeColor,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        initialRoute: RouteClass.homeScreen,
        onGenerateRoute: RouteClass.generateRoute,
      ),
    );
  }
}

