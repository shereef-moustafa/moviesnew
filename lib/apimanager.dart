import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'TOPRATEDsresponses.dart';
import 'constence.dart';


//https://api.themoviedb.org/3/movie/popular?api_key=ab0c209fd5767cfeb67e5f2e53ee8628
//https://api.themoviedb.org/3/movie/now_playing?api_key=ab0c209fd5767cfeb67e5f2e53ee8628

//this url is working
//https://api.themoviedb.org/3/movie/top_rated?api_key=ab0c209fd5767cfeb67e5f2e53ee8628&page=1

class  apimanage {
  static Future<TOPRATED> gettoprated() async {
    Uri url = Uri.https(base, '3/movie/top_rated', {"api_key": apikey});
    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      TOPRATED topratedrespons = TOPRATED.fromJson(
          json);
      return topratedrespons;
    } catch (e) {
      throw e;
    }
  }


}