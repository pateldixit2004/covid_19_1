
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/covidModel.dart';
import '../provider/covidProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  covidProvider? providerF;
  covidProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<covidProvider>(context, listen: false);
    providerT = Provider.of<covidProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Covid-19"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, 'serch');
            }, icon: Icon(Icons.search_rounded))
          ],
        ),
        body: FutureBuilder(future: providerF!.getData(),
            builder: (context, snapshot) {

              if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
              else if(snapshot.hasData)
                {

                  List<CovidModel>? list=snapshot.data!.cast<CovidModel>();
                  return ListView.builder(itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        CovidModel covidModel=CovidModel(country: list[index].country);
                        Navigator.pushNamed(context, 'view',arguments: covidModel);
                      },
                      child: ListTile(
                        title: Text("${list[index].country}"),
                        leading: Image.network('${list[index].countryInfo!.flag}',height: 50,width: 50,),

                      ),
                    );
                  },itemCount: list.length,);
                }
              return Center(child: CircularProgressIndicator());
            },),
      ),
    );
  }
}
