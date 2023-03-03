import 'package:flutter/material.dart';
import 'package:moviesnew/Future_Builder/NOW_Future_Builder.dart';
import 'package:moviesnew/Future_Builder/Popular_Futuer_Builder.dart';
import 'package:moviesnew/Future_Builder/TOP_Future_Builder.dart';
import 'package:moviesnew/Homepage/Homepage-navigator.dart';
import 'package:moviesnew/Homepage/HomepageScreen-vm.dart';
import 'package:moviesnew/Items/POP_movieitem.dart';
import 'package:moviesnew/homelayout/baseView.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  static const String routename = 'HomepageScreen';

  @override
  State<HomePageScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BaseView<HomePageScreen, HomepageVM>
    implements Homepage_Navigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.myNavigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewmodel,
        child: Scaffold(
          body: SingleChildScrollView(

            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 250,
                  color: Colors.red,
                  child: Expanded(child: (viewPOPULAR())),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Text(
                    'NEW REALEASE', style: TextStyle(color: Colors.blue),),
                ),
                Container(
                    height: 150,
                    color: Colors.black,
                    child: VIEW_NOWPLAYING(),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Text(
                    'TOP RATED', style: TextStyle(color: Colors.amber),),
                ),
                Container(
                  height: 210,
                  color: Colors.blue,
                  child: Expanded(child: (viewtoprated())),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        )
    );
  }

  @override
  HomepageVM initViewModel() {
    return HomepageVM();
  }
}
