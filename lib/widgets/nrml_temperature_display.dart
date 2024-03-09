import 'package:flutter/material.dart';

class NormalTemperatureDisplay extends StatelessWidget {
  const NormalTemperatureDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      padding: EdgeInsets.all(15.0),
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
            'Normal Temperature',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 1,
            color: Colors.grey,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
          ),
          Row(
            children: [
              Expanded(
                child: _buildTemperatureCell('Celcius', '37.0°'),
              ),
              _buildDivider(),
              Expanded(
                child: _buildTemperatureCell('Fahrenheit', '98.6°'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _buildTemperatureCell('Kelvin', '310.15°'),
              ),
              _buildDivider(),
              Expanded(
                child: _buildTemperatureCell('Reaumur', '29.6°'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureCell(String unit, String value) {
    return Column(
      children: [
        Text(
          unit,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40, // Sesuaikan tinggi dengan tinggi teks
      width: 1, // Ketebalan garis pemisah
      color: Colors.grey, // Warna garis pemisah
    );
  }
}
