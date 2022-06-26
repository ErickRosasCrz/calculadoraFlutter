import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '0'.obs;
  var secondNumber = '0'.obs;
  var mathResult = '0'.obs;
  var operation = ''.obs;

  var flagCarry = false;

  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '';
    flagCarry = false;
  }

  changeNegativePositive() {
    if (mathResult.startsWith('-')) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  addNumber(String number) {
    if (mathResult.value.length >= 13) return;
    if (mathResult.value == '0') return mathResult.value = number;

    //all negative number
    if (mathResult.value == '-0') {
      return mathResult.value = '-' + number;
    }

    mathResult.value = mathResult.value + number;
  }

  addDecimalPoint() {
    if (mathResult.contains('.') || mathResult.value.length >= 13) return;
    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }
  }

  selectOperation(String newOperation) {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);
    if (flagCarry == true) {
      firstNumber.value = mathResult.value;
      mathResult.value = '0';
      flagCarry = false;
      num2 = 0;
      secondNumber.value = '0';
    }
    if (operation.value != '' && num1 != 0) {
      if (num2 != 0) {
        switch (operation.value) {
          case '+':
            mathResult.value = '${num1 + num2}';
            break;
          case '-':
            mathResult.value = '${num1 - num2}';
            break;
          case 'X':
            mathResult.value = '${num1 * num2}';
            break;
          case '/':
            mathResult.value = '${num1 / num2}';
            break;
        }
        if (mathResult.value.endsWith('.0')) {
          mathResult.value =
              mathResult.value.substring(0, mathResult.value.length - 2);
        }
        firstNumber.value = mathResult.value;
      }
      operation.value = newOperation;
      mathResult.value = '0';
    } else {
      operation.value = newOperation;
      firstNumber.value = mathResult.value;
      mathResult.value = '0';
    }
  }

  deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${num1 + num2}';
        break;
      case '-':
        mathResult.value = '${num1 - num2}';
        break;
      case 'X':
        mathResult.value = '${num1 * num2}';
        break;
      case '/':
        mathResult.value = '${num1 / num2}';
        break;
    }
    if (mathResult.value.endsWith('.0')) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
    flagCarry = true;
  }
}
