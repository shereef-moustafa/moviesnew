import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moviesnew/components/firebase.dart';

import 'models/task.dart';


class taskitem extends StatelessWidget {
  static const String routname='taskitem';
  Task task;
  taskitem(this.task);
  @override
  Widget build(BuildContext context) {
    return Slidable(
  startActionPane: ActionPane(
    extentRatio: 1/2,
      motion: DrawerMotion()
      , children:[
        SlidableAction(
      icon: Icons.delete,
      backgroundColor: Colors.red,
      onPressed: (context){
        delettask(task.id);
      },
          label: 'Delete',
        ),
        SlidableAction(
        icon: Icons.edit,
        backgroundColor: Colors.blue,
        onPressed: (context){},
            label: 'Edit'
        ),
  ] ),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 80,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title
                  ,style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20),),
                SizedBox(height: 10,),

              ],
            )),
            SizedBox(width: 10,),
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )))
          ],
        ),
      ),
    );
  }
}
