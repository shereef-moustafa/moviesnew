import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/Details/TOPdeatails.dart';
import 'package:moviesnew/models/TopRated_responses.dart';


class TOPmovisitem extends StatelessWidget {
  TOPResults articles;
  TOPmovisitem(this.articles);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.black87,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, TOPArticalDetailsScreen.routname,arguments: articles);

              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 190,
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                            "https://image.tmdb.org/t/p/w500${articles.posterPath}",
                            height: 120,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image(
                              image:
                              new AssetImage('assets/images/filmposter.png'),
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          Image(
                            image: new AssetImage('assets/images/mark.png'),
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(articles.voteAverage.toString() ?? "",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.amber,
                              )),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        child: Center(
                          child: Text(
                            articles.title ?? "",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.amber,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
