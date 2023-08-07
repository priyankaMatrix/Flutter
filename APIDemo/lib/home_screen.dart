import 'dart:convert';

import 'package:flutter/material.dart';
import 'Models/PostModel.dart';
import 'package:http/http.dart' as http;



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostModel> postList = [];
  Future<List<PostModel>> getPostAPI ()async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200)
      {
        postList.clear();
        for(Map i in data)
        {
            postList.add(PostModel.fromJson(i));
        }
        return postList;
      }
    else
      {
         return postList;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription'),
      ),
      body: Column(children: [
        Expanded( // occupy the available space, can use flex
          child: FutureBuilder(// load data after loading the UI
            future: getPostAPI(),
            builder: (context , snapshot){
               if(!snapshot.hasData)
                 {
                   return Text('Loading');
                 }
               else
                 {
                   return ListView.builder(
                     itemCount: postList.length,
                       itemBuilder: (context,index)
                       {
                         return Card(
                           child: Padding(
                             padding: EdgeInsets.all(20),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text('Title: '+postList[index].title.toString()),
                                 Text('Body: '+postList[index].body.toString())
                               ],
                             ),
                           ),
                         );
                       }
                   );
                 }
            }
          )
        )
      ],),
    );
  }
}
