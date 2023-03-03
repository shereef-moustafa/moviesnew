import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/Wishlist/WishlistScreen.dart';
import 'package:moviesnew/components/firebase.dart';
import 'package:moviesnew/components/lodingmessage.dart';
import 'package:moviesnew/models/TopRated_responses.dart';
import 'package:moviesnew/models/task.dart';
import 'package:moviesnew/adtofire.dart';
import 'package:moviesnew/addtaskbottomsheet.dart';

class TOPArticalDetailsScreen extends StatefulWidget {
  static const String routname = 'ArticalDetailsScreen';

  @override
  State<TOPArticalDetailsScreen> createState() =>
      _TOPArticalDetailsScreenState();
}

class _TOPArticalDetailsScreenState extends State<TOPArticalDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    TOPResults articles =
    ModalRoute.of(context)!.settings.arguments as TOPResults;
    var txt = TextEditingController();
    var titlecontroler = txt;
     txt.text="${articles.title}";
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.black,
            ),
            Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        articles.title ?? "",
                        style: TextStyle(fontSize: 20, color: Colors.amber),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 200,
              color: Colors.red,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500${articles.posterPath}",
                fit: BoxFit.fill,
                height: 120,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child:  Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: txt,
                        enabled: false,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 130,
                        height: 200,
                        color: Colors.red,
                        margin: EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${articles.posterPath}",
                          fit: BoxFit.fill,
                          height: 120,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        child: Text(
                      articles.title ?? "",
                      style: TextStyle(color: Colors.white),
                    )),
                    Container(
                        width: 200,
                        child: Text(
                          articles.overview ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Container(
                            child: Text(
                          articles.voteAverage.toString() ?? "",
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Task tasks = Task(
                        title: txt.text);
                    showloading('Loading....',context);
                    addtasktofirestore(tasks).then((value) {hidloading(context);
                    showmessage(context,'Movie Added Successfully', 'ok', () {
                      Navigator.pop(context);
                      Navigator.pop(context);}
                        ,negbth: 'Cancel',negaction: (){});
                    }).catchError((error){
                      print(error);
                    });
                  }
                },
                child: Text('Add TO Watching list',style: TextStyle(color: Colors.amber),)),






          ],
        ),
      ),
      backgroundColor: Colors.white10,
    );
  }
}
