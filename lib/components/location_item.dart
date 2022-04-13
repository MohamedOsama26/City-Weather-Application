import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // color: Colors.pinkAccent,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/images/snow.png',height: 60),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cairo',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Yanone Kaffeesatz',
                    letterSpacing: 1,

                  ),
                ),
                SizedBox(height: 4,),
                Text('22°C',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cuprum',
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2,),
                Text('Snow',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Yanone Kaffeesatz',
                    letterSpacing: 1,
                    color: Colors.black.withOpacity(0.5)
                ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.delete,color: Colors.black.withOpacity(0.5),),
              ),
              onTap: (){
                print('tapped');
              },
            ),
          ],
        ),
      ),
      onTap: (){
        print('g');
      },
    );
  }
}
