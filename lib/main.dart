
import 'package:covid_19_1/screen/provider/covidProvider.dart';
import 'package:covid_19_1/screen/view/homeScreen.dart';
import 'package:covid_19_1/screen/view/serchScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => covidProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
          'serch':(context)=>SerchScreen(),
        },
      ),
    )
  );
}