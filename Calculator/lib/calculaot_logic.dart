class CalculatorLogic {
  double? _firstNumber;
  double? _secondNUmber;
  String? _operation;
  String _display = '0';
  bool _shouldClearDisplay = false;

  String get display => _display;

  void input(String value) {
    if (value == 'C') {
      _firstNumber = null;
      _secondNUmber = null;
      _operation = null;
      _display = '0';
      _shouldClearDisplay = false;
    } else if (value == '+' || value == '-' || value == '*' || value == '/') {
      _firstNumber = double.parse(_display);
      _operation = value;
      _shouldClearDisplay = true;
    } else if (value == '=') {
      _secondNUmber = double.parse(_display);
      if (_firstNumber != null && _secondNUmber != null && _operation != null) {
        switch (_operation) {
          case '+':
            _display = (_firstNumber! + _secondNUmber!).toString();
            break;
          case '-':
            _display = (_firstNumber! - _secondNUmber!).toString();
            break;
          case '*':
            _display = (_firstNumber! * _secondNUmber!).toString();
            break;
          case '/':
            _display = (_firstNumber! / _secondNUmber!).toString();
            break;
        }
        _firstNumber = null;
        _secondNUmber = null;
        _shouldClearDisplay = false;
      }
    } else {
      if (_shouldClearDisplay) {
        _display = value;
        _shouldClearDisplay = false;
      } else {
        if (_display == '0') {
          _display = value;
        } else {
          _display += value;
        }
      }
    }
  }
}
