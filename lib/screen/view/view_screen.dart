import 'package:covid_19_1/screen/model/covidModel.dart';
import 'package:covid_19_1/screen/provider/covidProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  covidProvider? providerF;
  covidProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<covidProvider>(context, listen: false);
    providerT = Provider.of<covidProvider>(context, listen: true);

    // List list= ModalRoute.of(context)!.settings.arguments as List;
    int index= ModalRoute.of(context)!.settings.arguments as int;
   // CovidModel model=ModalRoute.of(context)!.settings.arguments as CovidModel;
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(itemBuilder: (context, index) {
          //     return Text("${list[index].country}");
          //   },itemCount: list.length,),
          // ),
          // Text("${model.country}"),
          // Text("${index}"),
          // Text("${model.country}"),
          // Text("${model.countryInfo!.id}"),
          Container(
            child: Text("${providerT!.covidList[index].country}"),
          ),
        ],
      ),
    ),);
  }
}
