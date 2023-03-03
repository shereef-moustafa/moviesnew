import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:moviesnew/components/constant.dart';
import 'package:moviesnew/models/GenresRes.dart';
import 'package:moviesnew/models/NowPlaying_response.dart';
import 'package:moviesnew/models/Popular_responses.dart';
import 'package:moviesnew/models/SearchRes.dart';
import 'package:moviesnew/models/SingleGenRes.dart';
import 'package:moviesnew/models/TopRated_responses.dart';




//https://api.themoviedb.org/3/movie/latest?api_key=ab0c209fd5767cfeb67e5f2e53ee8628
//https://api.themoviedb.org/3/movie/popular?api_key=ab0c209fd5767cfeb67e5f2e53ee8628
//https://api.themoviedb.org/3/movie/now_playing?api_key=ab0c209fd5767cfeb67e5f2e53ee8628

//this url is working
//https://api.themoviedb.org/3/movie/top_rated?api_key=ab0c209fd5767cfeb67e5f2e53ee8628&page=1

class Api_manager {
  static Future<TOPRATED?> gettoprated() async {
    Uri url = Uri.https(Base_URL, '3/movie/top_rated', {"api_key": apikey});
    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      TOPRATED? topratedrespons = TOPRATED?.fromJson(
          json);
      return topratedrespons;
    } catch (e) {
      throw(e);
    }
  }

  static Future<POPULAR?> get_POPULAR() async {
    Uri url = Uri.https(Base_URL, '3/movie/popular', {"api_key": apikey});
    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      POPULAR POPULARrespons = POPULAR?.fromJson(
          json);
      return POPULARrespons;
    } catch (e) {
      print(e);
    }
  }
  static Future<SearchRes?> getMovies(
      { String? searchkeyword}) async {
    Uri URL = Uri.https(Base_URL, '3/search/movie',
        {"api_key": API_Key, "query": searchkeyword});

    try {
      Response newsData = await http.get(URL);
      var json = jsonDecode(newsData.body);
      SearchRes response = SearchRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }
  static Future<GenresRes?> getCategories() async {
    Uri URL = Uri.https(Base_URL, '3/genre/movie/list', {"api_key": API_Key});
    Response genres = await http.get(URL);
    try {
      var json = jsonDecode(genres.body);
      GenresRes response = GenresRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }
  static Future<SingleGenRes> getSingleCategory(String genresID) async {
    Uri URL = Uri.https(Base_URL, '3/discover/movie', {"api_key": API_Key , "with_genres" : genresID});
    Response genres = await http.get(URL);
    try {
      var json = jsonDecode(genres.body);
      SingleGenRes response = SingleGenRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }
  static Future<PLAYINGNOW?> get_PLAYINGNOW() async {
    Uri url = Uri.https(Base_URL, '3/movie/now_playing', {"api_key": apikey});
    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      PLAYINGNOW NOWPLAYINGrespons = PLAYINGNOW.fromJson(
          json);
      return NOWPLAYINGrespons;
    } catch (e) {
      print(e);
    }
  }
}