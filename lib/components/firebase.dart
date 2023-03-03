import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesnew/models/task.dart';



CollectionReference<Task> gettasks () {
  return FirebaseFirestore.instance.collection('tasks')
     .withConverter<Task>(fromFirestore: (s,o)=>Task.fromJson(s.data()!)
      , toFirestore:(task,o)=>task.toJson(),
  );
}

CollectionReference<Task> gettaskcollection (){

return FirebaseFirestore.instance.collection('tasks')
  .withConverter<Task>(fromFirestore: (snapshot , options)=> Task.fromJson(snapshot.data()!),
  toFirestore: (value,options) => value.toJson(),
);

}

Future<void> addtasktofirestore(Task tasks) {
  var collection = gettaskcollection();
  var docref = collection.doc();
  tasks.id = docref.id;
  return docref.set(tasks);
}
Stream<QuerySnapshot<Task>> gettasksfromfirebase(){

return gettaskcollection().snapshots();

  }
Future<void> delettask(String id){
 return gettaskcollection().doc(id).delete();

}




