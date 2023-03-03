import 'package:flutter/material.dart';
import 'package:moviesnew/components/firebase.dart';
import 'package:moviesnew/models/TopRated_responses.dart';
import 'package:moviesnew/models/task.dart';
import 'components/lodingmessage.dart';
import 'package:moviesnew/addtaskbottomsheet.dart';


class addtaskbottomsheet extends StatefulWidget {
 static const String routname='addtaskbottomsheet';
  @override
  State<addtaskbottomsheet> createState() => _addtaskbottomsheetState();
}
class _addtaskbottomsheetState extends State<addtaskbottomsheet> {
  var titlecontroler = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TOPResults? articles =
    ModalRoute.of(context)!.settings.arguments as TOPResults;
    return Scaffold(
    body:
      SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add movie to watching list',
              textAlign: TextAlign.center,
              style:TextStyle(fontSize: 20)
            ),
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: titlecontroler,
                      validator: (text) {
                        if (text != null && text.isEmpty) {
                          return ('Add movie to watching list');
                        }},
                      decoration: InputDecoration(
                        label: Text("${articles.title}"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            ),


            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Task tasks = Task(
                        title: titlecontroler.text);
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
                child: Text('Add task')),
          ],
        ),
      ),
      )
    );
  }


}
