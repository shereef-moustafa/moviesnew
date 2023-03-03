import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/Details/NOWdeatails.dart';
import 'package:moviesnew/Details/POPdeatails.dart';
import 'package:moviesnew/Details/TOPdeatails.dart';
import 'package:moviesnew/Search/searchScreen.dart';
import 'package:moviesnew/Single_category/single_category.dart';
import 'package:moviesnew/Wishlist/WishlistScreen.dart';
import 'package:moviesnew/addtaskbottomsheet.dart';
import 'package:moviesnew/adtofire.dart';

import 'package:moviesnew/categories/CategoriesScreen.dart';
import 'package:moviesnew/homelayout/HomepageScreen.dart';
import 'package:moviesnew/homelayout/home.dart';
import 'package:moviesnew/providers/genres_provider.dart';
import 'package:moviesnew/simmiler/similer_single_category.dart';
import 'package:moviesnew/taskitem.dart';

import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => Genress_provider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) =>HomeScreen(),
        CategoriesScreen.routename: (context) =>CategoriesScreen(),
        SingleCategory.routename: (context) =>SingleCategory(),
        HomePageScreen.routename: (context) =>HomePageScreen(),
        searchScreen.routename: (context) =>searchScreen(),
        WishlistScreen.routename: (context) =>WishlistScreen(),
        POPArticalDetailsScreen.routname:(context)=>POPArticalDetailsScreen(),
        TOPArticalDetailsScreen.routname:(context)=>TOPArticalDetailsScreen(),
        NOWArticalDetailsScreen.routname:(context)=>NOWArticalDetailsScreen(),
        similerSingleCategory.routename:(context)=>similerSingleCategory(),
    addtaskbottomsheet.routname:(context)=> addtaskbottomsheet(),


      },
    );
  }
}


