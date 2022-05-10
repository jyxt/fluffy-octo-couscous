import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_calc/calc_bloc_page.dart';
import 'package:proto_calc/calc_provider_page.dart';
import 'package:proto_calc/cubit/calculation_cubit.dart';
import 'package:proto_calc/provider_model/calculation.dart';
import 'package:provider/provider.dart';

const useProvider = true;
void main() {
  if (useProvider) {
    runApp(ChangeNotifierProvider(
        create: (context) => Calculation(), child: const MyApp()));
  } else {
    runApp(BlocProvider(
      create: (context) => CalculationCubit(),
      child: const MyApp(),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: useProvider ? CalcProviderPage() : CalcBlocPage(),
    );
  }
}
