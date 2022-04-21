import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '10'.obs;
  var secondNumber = '20'.obs;
  var mathResult = '3'.obs;
  var operation = '+'.obs;

  void resetAll() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    mathResult.value = '0';
    operation.value = '+';
  }

  changeNegativePositive() {
    if (mathResult.value.startsWith('-')) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  addNumber(String number) {
    if (mathResult.value == '0') return mathResult.value = number;

    if (mathResult.value == '-0') {
      return mathResult.value = '-' + number;
    }
    mathResult.value = mathResult.value + number;
  }

  addDecimalPoint() {
    if (mathResult.contains('.')) return;

    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }
  }

  selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
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
    double numero1 = double.parse(firstNumber.value);
    double numero2 = double.parse(mathResult.value);
    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = '${numero1 + numero2}';
        break;
      case '-':
        mathResult.value = '${numero1 - numero2}';
        break;
      case '/':
        mathResult.value = '${numero1 / numero2}';
        break;
      case 'X':
        mathResult.value = '${numero1 * numero2}';
        break;
      default:
        return;
    }
    if (mathResult.value.endsWith('.0')) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }
}
