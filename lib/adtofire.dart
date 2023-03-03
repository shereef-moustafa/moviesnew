import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class fire_add_data extends StatelessWidget {
  static const String routname='fire_add_data';

  final _controller=TextEditingController();

  void _savetask(){
    final taskname=_controller.text;
    FirebaseFirestore.instance.collection('moviewatshinglist').add({
    "name":taskname
    });


  }


  // var titlecontroler = TextEditingController();
  // GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Column(
        children: [
          Expanded(
            child: TextField(controller:_controller,

            
      )
          ),

      ElevatedButton(
          onPressed: () {
_savetask();
              },
    child: Text('Add task')),



    ]
    )
    );
  }
}
