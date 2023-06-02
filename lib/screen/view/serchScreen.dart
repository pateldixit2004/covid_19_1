import 'package:covid_19_1/screen/provider/covidProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SerchScreen extends StatefulWidget {
  const SerchScreen({Key? key}) : super(key: key);

  @override
  State<SerchScreen> createState() => _SerchScreenState();
}

class _SerchScreenState extends State<SerchScreen> {
  covidProvider? providerF;
  covidProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF=Provider.of<covidProvider>(context,listen: false);
    providerT=Provider.of<covidProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged:(value) {
              providerF!.serchCountry(value);
            },
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("${providerF!.list[index].country}"),
              );
            },itemCount: providerT!.list.length,),
          )
        ],
      ),
    ),);
  }
}
