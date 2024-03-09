import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/drop_down.dart';
import 'package:flutter_application_1/widgets/nrml_temperature_display.dart';

class TermoPage extends StatefulWidget {
  const TermoPage({Key? key}) : super(key: key);

  @override
  State<TermoPage> createState() => _TermoPageState();
}

class _TermoPageState extends State<TermoPage> {
  double _inputValue = 0;
  String _result = '0';
  String _selectedUnitA = 'Celcius';
  String _selectedUnitB = 'Fahrenheit';

  // Variabel untuk menyimpan satuan suhu yang dipilih oleh kedua dropdown
  String _unitA = 'Celcius';
  String _unitB = 'Fahrenheit';

  void _convertTemperature(double input, String unitA, String unitB) {
    setState(() {
      _inputValue = input;
      // Convert input from unit A to Celcius first
      double celciusValue = input;
      switch (unitA) {
        case 'Fahrenheit':
          celciusValue = (input - 32) * 5 / 9;
          break;
        case 'Kelvin':
          celciusValue = input - 273.15;
          break;
        case 'Reaumur':
          celciusValue = input * 5 / 4;
          break;
        default:
          celciusValue = input;
      }
      // Convert from Celcius to unit B
      switch (unitB) {
        case 'Fahrenheit':
          _result = ((celciusValue * 9 / 5) + 32).toStringAsFixed(2);
          break;
        case 'Kelvin':
          _result = (celciusValue + 273.15).toStringAsFixed(2);
          break;
        case 'Reaumur':
          _result = (celciusValue * 4 / 5).toStringAsFixed(2);
          break;
        default:
          _result = celciusValue.toStringAsFixed(2);
      }
      // Trim decimal places if the second digit after the decimal is 0
      if (_result.contains('.') && _result.split('.')[1][1] == '0') {
        _result = _result.split('.')[0] + '.' + _result.split('.')[1][0];
      }
      // Remove decimal point if the result is an integer
      if (_result.contains('.') &&
          double.parse(_result) == double.parse(_result).toInt()) {
        _result = double.parse(_result).toInt().toString();
      }
    });
  }

  void _switchUnits() {
    setState(() {
      String tempUnit = _selectedUnitA;
      _selectedUnitA = _selectedUnitB;
      _selectedUnitB = tempUnit;

      String tempResultUnit = _unitA;
      _unitA = _unitB;
      _unitB = tempResultUnit;

      if (_inputValue == 0) {
        // If inputValue is 0, result should remain 0
        _result = '0';
      } else {
        // If inputValue is not 0, re-convert the temperature
        _convertTemperature(_inputValue, _selectedUnitA, _selectedUnitB);
      }
    });
  }

  Color mainColor = Color.fromARGB(255, 19, 19, 47);
  Color secondColor = Color(0xFF2849E6);

  @override
  Widget build(BuildContext context) {
    List<String> temperatureUnits = [
      'Celcius',
      'Fahrenheit',
      'Kelvin',
      'Reaumur'
    ];

    return Scaffold(
      resizeToAvoidBottomInset:
          false, //menghindari efek dari keyboard yang muncul
      backgroundColor: mainColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Untuk menutup keyboard
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                width: 250.0,
                child: Text(
                  "Temperature Converter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Input value to convert (°)",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                    color: secondColor,
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _convertTemperature(
                        double.parse(value), _selectedUnitA, _selectedUnitB);
                  } else {
                    setState(() {
                      _inputValue = 0; // Set _inputValue to 0
                      _result = '0';
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customDropDown(temperatureUnits, _selectedUnitA, (val) {
                    setState(() {
                      if (val != _selectedUnitB) {
                        _selectedUnitA = val!;
                        _unitA = val; // Menyimpan satuan suhu yang dipilih
                        if (_inputValue == 0) {
                          // If inputValue is 0, result should remain 0
                          _result = '0';
                        } else {
                          // If inputValue is not 0, re-convert the temperature
                          _convertTemperature(
                              _inputValue, _selectedUnitA, _selectedUnitB);
                        }
                      } else {
                        // Show warning dialog if the same unit is selected
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Warning"),
                              content: Text(
                                  "Cannot select the same temperature unit."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  }),
                  Material(
                    shape: CircleBorder(),
                    color: secondColor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: _switchUnits,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.compare_arrows,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  customDropDown(temperatureUnits, _selectedUnitB, (val) {
                    setState(() {
                      if (val != _selectedUnitA) {
                        _selectedUnitB = val!;
                        _unitB = val; // Menyimpan satuan suhu yang dipilih
                        if (_inputValue == 0) {
                          // If inputValue is 0, result should remain 0
                          _result = '0';
                        } else {
                          // If inputValue is not 0, re-convert the temperature
                          _convertTemperature(
                              _inputValue, _selectedUnitA, _selectedUnitB);
                        }
                      } else {
                        // Show warning dialog if the same unit is selected
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Warning"),
                              content: Text(
                                  "Cannot select the same temperature unit."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    });
                  }),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Result ($_unitB)', // Menampilkan satuan suhu yang dipilih
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                    // SizedBox(height: 4),
                    Text(
                      _result + '°', // Tambahkan simbol derajat di sini
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: secondColor,
                      ),
                    ),
                  ],
                ),
              ),
              NormalTemperatureDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
