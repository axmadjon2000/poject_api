class Post{
  int id,userId;
  String title,body;

  Post({this.id,this.title,this.body,this.userId});

  Post.fromJson(Map<String,dynamic> json):
      id=json['id'],
      title=json['title'],
      body=json['body'],
      userId=json['userId'];

  Map<String,dynamic> toJson(){
    return {
      'id':this.id,
      'title':this.title,
      'body':this.body,
      'userId':this.userId,
    };
  }
}