import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/Details/POPdeatails.dart';
import 'package:moviesnew/models/Popular_responses.dart';





class POPmovisitem extends StatelessWidget {
  POPResults POP;

  POPmovisitem(this.POP);

  @override
  Widget build(BuildContext context) {
    return
         Container(
          height: 300,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.black,
          ),
          child: Stack(children: [
            Expanded(
              child:
                  Opacity(opacity: 0.3, child: CachedNetworkImage(
                    imageUrl:  "https://image.tmdb.org/t/p/w500${POP.posterPath}",fit: BoxFit.fill,width: 370,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>  Image(
                      image: new AssetImage(
                          'assets/images/filmposter.png'),alignment: Alignment.topCenter,


                    ),
          ),),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, POPArticalDetailsScreen.routname,arguments: POP);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                          elevation: 15,
                          // Change this
                          shadowColor: Colors.black,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 150,
                            height: 200,
                            child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
    imageUrl:
    "https://image.tmdb.org/t/p/w500${POP.posterPath}",fit: BoxFit.cover,width: 300,
    height: 200,
    placeholder: (context, url) =>
    Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => Image(
    image:
    new AssetImage('assets/images/filmposter.png'),
    alignment: Alignment.topCenter,
    ),
    ),
                                    ))),
                          )
                    ],
                          ),
                ),
                        Column(
                        mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Row(
    children: [
    Container(
    width: 200,
    height: 100,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Center(
    child: Text(
    POP.title ?? "",
    style: TextStyle(
    fontSize: 20,
    color: Colors.white,
    ),
    textAlign: TextAlign.center,
    ),
    ),
    Center(
    child: Text(
    POP.releaseDate ?? "",
    style: TextStyle(
    fontSize: 15,
    color: Colors.white,
    ),
    textAlign: TextAlign.center,
    ),
    )
    ],
    ),
    ),
                  ],
                ),

                      ],
                    ),
    ],
    )
          ],
    )

      );
  }
}
