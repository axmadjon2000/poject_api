import 'package:flutter/material.dart';
import 'package:poject_api/models/post_model.dart';
import 'package:poject_api/service/http_service.dart';
class HomePage extends StatefulWidget {
  static const String id='home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data;
  void _apiPostList(){
    NetW.GET(NetW.API_LIST,NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _apiCreateList(Post post){
    NetW.POST(NetW.API_CREATE,NetW.paramsCreate(post)).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _apiUpdateList(Post post){
    NetW.PUT(NetW.API_UPDATE+post.id.toString(),NetW.paramsUpdate(post)).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _apiDeleteList(Post post){
    NetW.DEL(NetW.API_DELETE+post.id.toString(),NetW.paramsEmpty()).then((response){
      print(response);
      _showResponse(response);
    });
  }
  void _showResponse(String response){
    setState(() {
      data=response;
    });
  }

  @override
  void initState(){
    super.initState();
    var post=new Post(id:1,title: 'pdp',body: 'online',userId: 1);
    _apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text(data !=null?data:'No data'),
      ),
    );
  }
}
