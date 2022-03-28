import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ismailia',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Yanone Kaffeesatz',
                            letterSpacing: 1),
                      ),
                      Text(
                        'Current Location',
                        style: TextStyle(
                            fontFamily: 'Yanone Kaffeesatz',
                            color: Colors.black.withOpacity(0.7),
                            letterSpacing: 2,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.map_outlined,
                          size: 30,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onTap: (){},
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          child: Icon(
                        Icons.settings_outlined,
                        size: 30,
                        color: Colors.black.withOpacity(0.5),
                      ),
                        splashColor: Colors.transparent,
                        onTap: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text('in sync'),
          Text('Friday, 25 December 2022'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('22'),
            Text('°C')
          ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Row(children: [Icon(Icons.arrow_downward),Text('16°C')],),),
              SizedBox(width: 20,),
              Container(child: Row(children: [Icon(Icons.arrow_upward),Text('16°C')],),)
            ],
          ),
        ],
      ),
    );
  }
}
