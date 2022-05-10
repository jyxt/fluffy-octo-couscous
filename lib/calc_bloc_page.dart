import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto_calc/common.dart';
import 'package:proto_calc/cubit/calculation_cubit.dart';
import 'package:proto_calc/provider_model/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcBlocPage extends StatelessWidget {
  double displayHeight = 168;
  @override
  Widget build(BuildContext context) {
    double buttonHeight =
        (MediaQuery.of(context).size.height - displayHeight) / 4;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: displayHeight,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          child: Stack(
            children: [
              Positioned(
                child: BlocBuilder<CalculationCubit, CalculationState>(
                  builder: (context, state) => Text(
                    state.displayValue,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                bottom: 20,
                right: 42,
              )
            ],
          ),
        ),
      ),
      Expanded(
          child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: buttonHeight),
              itemCount: calcButtonData.length + 1,
              itemBuilder: (BuildContext context, index) {
                if (index == 12) return Container();
                if (index > 12) index--;

                final buttonData = calcButtonData[index];
                final calculationModel =
                    BlocProvider.of<CalculationCubit>(context);
                return InkWell(
                    onTap: () {
                      switch (buttonData.operator) {
                        case Operator.value:
                          calculationModel.addDigit(buttonData.value!);
                          break;
                        case Operator.add:
                          calculationModel.add();
                          break;
                        case Operator.subtract:
                          calculationModel.subtract();
                          break;
                        case Operator.equal:
                          calculationModel.equal();
                          break;
                      }
                    },
                    child: Center(
                        child: Text(
                      buttonData.toString(),
                      style: const TextStyle(fontSize: 37),
                    )));
              }))
    ]));
  }
}
