
class Task {

  String id ;
  String title ;


   Task({this.id='', this.title=
   ''});

  Map<String ,dynamic> toJson(){
    return {
      "id":id,
      "title":title,


    };

  }
  Task.fromJson(Map<String ,dynamic>json)
        :this(
      id: json['id'],
      title: json['title'],


  );

}

