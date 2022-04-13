import 'package:flutter/material.dart';

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios,color: Colors.black.withOpacity(0.5),size: 17,),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 8,),
                    Container(
                      child: const Text(
                        'Add New Location',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Yanone Kaffeesatz',
                            color: Colors.black45,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                  // boxShadow:
                ),
                // color: Colors.black12,
                child: TextFormField(
                  decoration: const InputDecoration(
                    focusColor: Colors.black26,
                    iconColor: Colors.black26,
                    hoverColor: Colors.black26,
                    fillColor: Colors.red,
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  cursorColor: Colors.black87,
                ),
              ),

              SizedBox(height: 20,),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Yanone Kaffeesatz',
                                  color: Colors.black,
                                  letterSpacing: 1),
                            ),
                            Text('Region',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Yanone Kaffeesatz',
                                  color: Colors.black.withOpacity(0.7),
                                  letterSpacing: 1),
                            ),
                            Text('Country',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Yanone Kaffeesatz',
                                  color: Colors.black,
                                  letterSpacing: 2),
                            ),
                          ],
                        ),
                      ),


                      Spacer(),
                      Icon(Icons.add),
                    ],
                  ),
                ),
                onTap: (){
                  print('Added');
                },
              ),






            ],
          ),
        ),
      ),
    );
  }
}
