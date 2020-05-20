import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavingsPageOne extends StatefulWidget {
  @override
  _SavingsPageOneState createState() => _SavingsPageOneState();
}

class _SavingsPageOneState extends State<SavingsPageOne> {
  final DateFormat _dateFormat = new DateFormat("MMMM y");
  final DateTime _currentDate = DateTime.now();
  String _currency = "\£";
  double _savingsGoal = 0.0;
  DateTime _savingsDate = DateTime.now().add(Duration(days: 180));
  double _currentSavings = 0.0;
//  double _interestRate = 0.0;
  double _calculatedSavingsPerMonth = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('What is your savings goal? (in $_currency) *'),
                        TextFormField(
                          enabled: true,
                          initialValue: _savingsGoal.toString(),
                          keyboardType: TextInputType.number,
                          autovalidate: true,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a number, damnit';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _savingsGoal = double.parse(value);
                            _calculate();
                          },
                        ),
                        Text(
                            'How much have you saved already? (in $_currency)'),
                        TextFormField(
                          enabled: true,
                          initialValue: _currentSavings.toString(),
                          keyboardType: TextInputType.number,
                          autovalidate: true,
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a number, damnit';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _currentSavings = double.parse(value);
                            _calculate();
                          },
                        ),
                        Text('When do you need your savings by?'),
                        FlatButton(
                          child: Text(_dateFormat.format(_savingsDate)),
                          onPressed: () async {
                            await _selectDate(context);
                            _calculate();
                          },
                        ),
//                        Text(
//                            'Gross annual interest rate on your savings (in %)'),
//                        TextFormField(
//                          enabled: true,
//                          initialValue: _interestRate.toString(),
//                          keyboardType: TextInputType.number,
//                          autovalidate: true,
//                          textAlign: TextAlign.center,
//                          validator: (value) {
//                            if (value.isEmpty) {
//                              return 'Please enter a number, damnit';
//                            }
//                            return null;
//                          },
//                          onChanged: (value) {
//                            _interestRate = double.parse(value);
//                            _calculate();
//                          },
//                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'You need to save $_currency${_calculatedSavingsPerMonth.round()} per month to save $_currency${_savingsGoal.round()} by ${_dateFormat.format(_savingsDate)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _savingsDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != _savingsDate)
      setState(() {
        _savingsDate = picked;
      });
  }

  void _calculate() {
    Duration durationDifference;
    if (_currentDate.isAfter(_savingsDate)) {
      durationDifference = Duration();
    } else {
      durationDifference = _savingsDate.difference(_currentDate);
    }

    int durationDifferenceInMonths =
        (durationDifference.inDays / (365 / 12)).floor();

    double difference = 0.0;
    if (_savingsGoal > _currentSavings) {
      difference = _savingsGoal - _currentSavings;
    }

    setState(() {
      _calculatedSavingsPerMonth = difference / durationDifferenceInMonths;
    });
  }
}
