import 'package:flutter/material.dart';



import 'package:moviesnew/Items/NOW_movieitem.dart';
import 'package:moviesnew/apimanager.dart';
import 'package:moviesnew/models/NowPlaying_response.dart';


class   VIEW_NOWPLAYING extends StatelessWidget {
  static const String routname = 'VIEW_NOWPLAYING';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<PLAYINGNOW?>(
            future: Api_manager.get_PLAYINGNOW(),
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
              var NOWPLYINGRdata = snapshot.data?.nowresults ?? [];
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: NOWPLYINGRdata.length,
                  itemBuilder: (context, index) {
                    return
                      NOWmovisitem(NOWPLYINGRdata[index]);

                  },
                ),
              );
            })
      ]),
    );
  }
}
