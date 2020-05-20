import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavingsPageTwo extends StatefulWidget {
  @override
  _SavingsPageTwoState createState() => _SavingsPageTwoState();
}

class _SavingsPageTwoState extends State<SavingsPageTwo> {
  final DateFormat _dateFormat = new DateFormat("MMMM y");
  final DateTime _currentDate = DateTime.now();
  String _currency = "\£";
  double _savingsGoal = 0.0;
  DateTime _expectedSavingsDate = DateTime.now();
  double _currentSavings = 0.0;
//  double _interestRate = 0.0;
  double _savingsPerMonth = 0.0;

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
                        Text('How much can you save? (in $_currency) *'),
                        TextFormField(
                          enabled: true,
                          initialValue: _savingsPerMonth.toString(),
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
                            _savingsPerMonth = double.parse(value);
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
                      'It will take until ${_dateFormat.format(_expectedSavingsDate)} to save $_currency${_savingsGoal.round()} at $_currency${_savingsPerMonth.round()} per month',
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

  void _calculate() {
    double difference = 0.0;
    if (_savingsGoal > _currentSavings) {
      difference = _savingsGoal - _currentSavings;
    }

    int numberOfMonthsSaving = (difference / _savingsPerMonth).ceil();
    int numberOfDaysSaving = (numberOfMonthsSaving * 30.436875).ceil();
    DateTime expectedSavingsDate =
        _currentDate.add(Duration(days: numberOfDaysSaving));

    setState(() {
      _expectedSavingsDate = expectedSavingsDate;
    });
  }
}
