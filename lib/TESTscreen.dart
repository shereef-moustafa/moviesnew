import 'package:flutter/material.dart';
import 'package:moviesnew/TOPRATEDsresponses.dart';
import 'package:moviesnew/apimanager.dart';

class viewtoprated extends StatelessWidget {
  static const String routname = 'viewtoprated';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<TOPRATED>(
            future: apimanage.gettoprated(),
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
              var topdata = snapshot.data?.results ?? [];
              return

                Expanded(
                  child: ListView.builder(
                      itemCount: topdata.length,
                      itemBuilder: (context, index) {
                        return
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(topdata[index].title ?? "",

                                ),
                              ),
                            ),
                          );



            }

    ),
                );

            }
                                  )

]
    )
                            );
            }



  }

