import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'TOPRATEDsresponses.dart';

class viewtops extends StatelessWidget {
  static const String routname="viewtops";

  Results articles;
  viewtops(this.articles);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          imageUrl: articles.posterPath??"",
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>  Image(
            image: new AssetImage(
                'assets/images/filmposter.png'),alignment: Alignment.topCenter,
            height: 120,
          ),
        ),
//articles.urlToImage??""

      ],


    );

  }
}
