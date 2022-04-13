import 'package:city_weather/components/search_bar.dart';
import 'package:city_weather/logic/address/address_bloc.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/presentation/home_view.dart';
import 'package:city_weather/presentation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialAddressScreen extends StatefulWidget{
  const InitialAddressScreen({Key? key}) : super(key: key);

  @override
  State<InitialAddressScreen> createState() => _InitialAddressScreenState();
}

class _InitialAddressScreenState extends State<InitialAddressScreen> {


  bool focused = false;
  List<ListTile> list = [
    ListTile(
      title: Text('number 1'),
      subtitle: Text('hy'),
    ),
    ListTile(
      title: Text('number 2'),
      subtitle: Text('hy'),
    ),
    ListTile(
      title: Text('number 3'),
      subtitle: Text('hy'),
    ),
    ListTile(
      title: Text('number 4'),
      subtitle: Text('hy'),
    ),
    ListTile(
      title: Text('number 5'),
      subtitle: Text('hy'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          // height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.passthrough,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // alignment: Alignment.centerLeft,
            children: [
              Positioned(
                child: AnimatedOpacity(
                  opacity:  focused ? 0 : 1,
                  duration: Duration(milliseconds: 100),
                  child: Column(
                    children: [
                      Spacer(),
                      Text('Welcome',
                        style: TextStyle(
                            fontFamily: 'Yanone Kaffeesatz',
                            // color: Colors.black.withOpacity(0.7),
                            // color: mine,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            fontSize: 45),),
                      Text('Please Select your city',
                        style: TextStyle(
                            fontFamily: 'Yanone Kaffeesatz',
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            fontSize: 35),),
                      Spacer(),
                      Text('or',style: TextStyle(
                          fontFamily: 'Yanone Kaffeesatz',
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                          fontSize: 25),),
                      SizedBox(height: 20),
                      Container(
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.gps_fixed,color: Colors.black.withOpacity(0.5),),
                              SizedBox(width: 4,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.85,
                                child: Text('You can choose your current location by GPS',
                                    style: TextStyle(
                                        fontFamily: 'Yanone Kaffeesatz',
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                        fontSize: 20),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          onTap: (){
                            // BlocListener(listener: listener)
                            // BlocProvider.of<LocationBloc>(context).add(FetchLocation());
                            BlocProvider.of<AddressBloc>(context).add(GetAddress());
                            // setState(() {
                            //   mine = Colors.blue;
                            // });
                            // print('Here State is : ${UserAddressState().position}');
                            // // Future.doWhile(() => UserAddressState().position==null);
                            // print('Here State is : ${UserAddressState().position}');
                          //   while(UserAddressState().position==null){
                          //   print(
                          //       'In initial address screen, state is : ${UserAddressState().position}');
                          // }
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SpalshView(duration: 4,)));
                          },
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                top: focused? 35 : MediaQuery.of(context).size.height/2-47,
                  child: Column(
                    children: [
                      SearchBar(
                        onFocus: (){
                          // setState(() {
                          //   mine = Colors.green;
                          //   focused = true;
                          // });
                        },
                        onSubmit: (){
                          setState(() {
                            focused = false;
                          });
                        },
                        onChange: (){

                        },
                ),

                    ],
                  ),
              ),

            ],
          ),
        ),

    );
  }
}