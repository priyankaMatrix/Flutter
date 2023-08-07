import 'package:flutter/material.dart';

Widget header() {
  return Container(
    color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(padding:EdgeInsets.all(20),
              child:Row(
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(width:10),
                  const Text('Velospot',style:TextStyle(fontWeight:FontWeight.bold)),
                  SizedBox(width:2),
                  Text('by Publibike',style:TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Colors.black12,
            )
          ]
      )
  );
}