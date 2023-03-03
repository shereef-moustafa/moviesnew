import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/Details/NOWdeatails.dart';
import 'package:moviesnew/models/NowPlaying_response.dart';



class NOWmovisitem extends StatelessWidget {
  NOWResults NOW;
  NOWmovisitem(this.NOW);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 130,
        color: Colors.black87,
        child: Row(
          children: [
            SizedBox(width: 8,),
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                Stack(
                  children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, NOWArticalDetailsScreen.routname,arguments: NOW);
                  },
                  child: CachedNetworkImage(
                  imageUrl:
                  "https://image.tmdb.org/t/p/w500${NOW.posterPath}",
                    height: 120,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image(
                      image:
                      new AssetImage('assets/images/filmposter.png'),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Image(
                  image: new AssetImage('assets/images/mark.png'),
                  alignment: Alignment.topLeft,
                ),
                    Image(
                      image: new AssetImage(
                          'assets/images/mark.png'),alignment: Alignment.topLeft,
                    ),

                  ],

                )

            ),
          ],
        ),
      );
  }
}
