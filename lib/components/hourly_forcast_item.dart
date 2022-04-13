import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
      ),
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '10:00 AM',
            style: TextStyle(color: Colors.black),
          ),
          Image.asset('assets/images/rain.png', width: 50, color: Colors.black),
          const Text(
            '16°C',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
