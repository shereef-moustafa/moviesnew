import 'package:flutter/material.dart';
import 'package:moviesnew/Items/POP_movieitem.dart';
import 'package:moviesnew/apimanager.dart';
import 'package:moviesnew/models/Popular_responses.dart';

class viewPOPULAR extends StatelessWidget {
  static const String routname = 'viewPOPULAR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<POPULAR?>(
            future: Api_manager.get_POPULAR(),
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
              var POPULARdata = snapshot.data?.popresults ?? [];
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: POPULARdata.length,
                  itemBuilder: (context, index) {
                    return
                      POPmovisitem(POPULARdata[index]);


                  }
                ),
              );
            })
      ]),
    );
  }
}
