import 'package:city_weather/components/location_item.dart';
import 'package:city_weather/presentation/add_city_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(0.5),size: 17,),
                          onTap: () => Navigator.pop(context),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          // alignment: Alignment.centerLeft,
                          child: const Text(
                            'Select City',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Yanone Kaffeesatz',
                                color: Colors.black45,
                                letterSpacing: 1),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            child: Icon(Icons.add,color: Colors.black.withOpacity(0.5)),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddCityScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      // color: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      margin: EdgeInsets.only(top: 22),
                      child: Row(
                        children: [
                          Icon(Icons.gps_fixed,color: Colors.black.withOpacity(0.5),),
                          SizedBox(width: 4,),
                          Text('Get current location by GPS',style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: Colors.black.withOpacity(0.7),
                              letterSpacing: 2,
                              fontSize: 15))
                        ],
                      ),
                    ),
                    onTap: (){
                      print('GPS');
                    },
                  ),
                  SizedBox(
                    // color: Colors.blue,
                    height: MediaQuery.of(context).size.height-100,
                    child: ListView(
                      children: [
                        LocationItem(),
                        LocationItem(),
                        LocationItem(),
                      ],
                    ),
                  ),
                ],
              )
          ),
      ),
    );
  }
}
