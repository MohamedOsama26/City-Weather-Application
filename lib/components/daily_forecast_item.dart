import 'package:flutter/material.dart';

class DailyForecastItem extends StatelessWidget {
  const DailyForecastItem({Key? key}) : super(key: key);

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
            '26 Dec',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Image.asset('assets/images/rain.png', width: 40, color: Colors.black),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_upward,
                color: Colors.black.withOpacity(0.5),
                size: 17,
              ),
              Text(
                '16°C',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_downward,
                color: Colors.black.withOpacity(0.5),
                size: 17,
              ),
              Text(
                '16°C',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
