import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/model/covidModel.dart';

class Apihelper
{
  static Apihelper apihelper=Apihelper();


  Future<List<CovidModel>> getApi()
  async {
    String link ='https://corona.lmao.ninja/v2/countries?yesterday=null&sort=null';
    var responce=await http.get(Uri.parse(link));
    List json=jsonDecode(responce.body);
    List<CovidModel> covidDataList=json.map((e) => CovidModel.fromJson(e)).toList();
    return covidDataList;
  }
}