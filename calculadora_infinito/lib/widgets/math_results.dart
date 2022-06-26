import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculadora_infinito/widgets/line_separator.dart';
import 'package:calculadora_infinito/widgets/main_result.dart';
import 'package:calculadora_infinito/widgets/sub_result.dart';
import 'package:calculadora_infinito/controllers/calculator_controller.dart'; 

class MathResults extends StatelessWidget {


  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(( ) => Column(
      children: [
            SubResult(text: '${calculatorCtrl.firstNumber}'),
            SubResult(text: '${calculatorCtrl.operation}'),
            SubResult(text: '${calculatorCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathResult}'),
      ],
      )
    );
  }
} 

