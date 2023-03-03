import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moviesnew/components/firebase.dart';
import 'package:moviesnew/homelayout/baseView.dart';
import 'package:moviesnew/models/task.dart';
import 'package:moviesnew/taskitem.dart';
import 'package:provider/provider.dart';
import 'Wishlist-navigator.dart';
import 'Wishlist-vm.dart';

class WishlistScreen extends StatefulWidget {
  static const String routename = 'WishlistScreen';

  @override
  State<WishlistScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BaseView<WishlistScreen, WishlistVM>
    implements Wishlist_Navigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.myNavigator = this;
  }
final db=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                ' Watching Screen',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child:StreamBuilder<QuerySnapshot<Task>>(
    stream: gettasksfromfirebase(),
    builder:(context,snapshot){
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator());
    }
    if(snapshot.hasError){
    return Center(child: Text('Somthing went rong'));
    }
    var tasks=snapshot.data?.docs.map((e) => e.data()).toList();
    return ListView.builder(itemBuilder: (context,index){
    return taskitem(tasks[index]);
    },
    itemCount: tasks!.length,
    );
    }


    )
    )
                    ],
                    
                    )


      )

                
              );
                



  }




  @override
  WishlistVM initViewModel() {
    return WishlistVM();
  }
}
