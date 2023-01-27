

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviesnew/apimanager.dart';
import 'package:moviesnew/viewitem.dart';

import 'newsresponses.dart';
class homepage extends StatelessWidget {
  static const String routname = 'homepge';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Autogenerateds>(
       future: apimanage.gettoprated(),
    builder: (context,snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child:CircularProgressIndicator());
    }
    if(snapshot.hasError)
    return Center(
    child: Column(
    children: [
    Text('Something Went wrong'),
    TextButton(onPressed: (){},child: Text('Try Again'))
    ],

    ),
    );
    if(snapshot.hasData == "200"){
    return Center(
    child: Column(
    children: [

    TextButton(onPressed: (){},child: Text('Try Again'))
    ],

    ),
    );

    }
    var Newsdata=snapshot.data?.results??[];
    return ListView.builder(
      itemCount: Newsdata.length,
    itemBuilder: (context,index) {
      return Text(Newsdata[index].originalTitle ?? "");

      //viewitem(Newsdata[index]);

    }


    );
  }
    );


  }
}
