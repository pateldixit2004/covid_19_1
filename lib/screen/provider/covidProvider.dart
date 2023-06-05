
import 'package:covid_19_1/screen/model/covidModel.dart';
import 'package:flutter/foundation.dart';

import '../../utils/api_helper.dart';

class covidProvider extends ChangeNotifier
{
  List<CovidModel> covidList=[];
  Future<List> getData()
  async {
    covidList= await Apihelper.apihelper.getApi();
    return covidList;
  }

  List<CovidModel> list=[];
  List<CovidModel> ferterList=[];
  void serchCountry(String serch)
  {
    if(serch.isEmpty)
      {
        list=covidList;
      }
    else
      {
        ferterList.clear();
        for(var c in covidList)
          {
            if(c.country!.toLowerCase().contains(serch!.toLowerCase()))
              {
                ferterList.add(c);
              }
          }
        list=ferterList;
      }
    notifyListeners();
  }
}