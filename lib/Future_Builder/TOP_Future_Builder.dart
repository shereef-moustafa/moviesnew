import 'package:flutter/material.dart';
import 'package:moviesnew/Items/TOP_movieitem.dart';




import 'package:moviesnew/apimanager.dart';
import 'package:moviesnew/models/TopRated_responses.dart';


class viewtoprated extends StatefulWidget {
  static const String routname = 'viewtoprated';

  @override
  State<viewtoprated> createState() => _viewtopratedState();
}
class _viewtopratedState extends State<viewtoprated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<TOPRATED?>(
            future: Api_manager.gettoprated(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError)
                return Center(
                  child: Column(
                    children: [
                      Text('Something Went wrong'),
                      TextButton(onPressed: () {}, child: Text('Try Again'))
                    ],
                  ),
                );
              var topdata = snapshot.data!.results ?? [];
              return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topdata.length,
                      itemBuilder: (context, index) {
                        return TOPmovisitem(topdata[index]);
                      }));
            })
      ]),
    );
  }
}
