import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/MySubscriptionListModel.dart';
import 'Header/header.dart';

class SubscriptionListScreen extends StatefulWidget {
  const SubscriptionListScreen({super.key});

  @override
  State<SubscriptionListScreen> createState() => _SubscriptionListScreenState();
}

class _SubscriptionListScreenState extends State<SubscriptionListScreen> {

  List<ResponseData> subscriptionList = [];
  Future<List<ResponseData>> subscriptionListAPI ()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? customerId = prefs.getString('customerId');
    String? sessionId = prefs.getString('sessionId');
    try
    {
      Response response = await post(
          Uri.parse("https://test.velospot.ch/customer/public/api/app/subscriptionListByCustomer"),
          body: {
            'os':'iOS',
            'appVersion':'2.5',
            'osVersion':'14.8',
            'platformType':'App-iOS',
            'locale':'en',
            'customerId': customerId,
            'sessionId':sessionId,
            'start':'0',
            'limit':'20'
          }
      );
      print(customerId);
      print(sessionId);
      if(response.statusCode == 200)
      {
        var mySubscriptionResponse = MySubscriptionListModel.fromJson(jsonDecode(response.body));
        print(mySubscriptionResponse.responseStatus?.statuscode);
        if(mySubscriptionResponse.responseStatus?.statuscode == "200")
        {
          var data = jsonDecode(response.body.toString());
          subscriptionList.clear();
          print(data);
          subscriptionList = mySubscriptionResponse.responseData!;
          return subscriptionList;
        }
        else
        {
          return subscriptionList;
        }

      }
      else
      {
        return subscriptionList;
      }
    }
    catch(e)
    {
      print(e.toString());
      return subscriptionList;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subscription'),
      ),
      body: Column(
        children: [
          header(),
          Expanded(
            child: FutureBuilder(
              future: subscriptionListAPI(),
              builder: (context , snapshot)
              {
              if(!snapshot.hasData)
              {
              return Text('Loading');
              }
              else
              {
                return ListView.separated(
                    itemCount: subscriptionList.length,
                    itemBuilder: (context,index)
                    {
                      return  //_buildSubscriptionModelList(subscriptionList[index]);
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(subscriptionList[index].displaySubscriptionType.toString()),
                                  Image.asset('assets/images/GreyDownArrow.png'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Valid until'),
                                  Text(subscriptionList[index].validTo.toString()),
                                ],
                              ),
                            ],
                          ),
                      );
                    },
                    separatorBuilder: (context,index) => const Divider(
                      height: 2,
                      color: Colors.black12,
                    ),
                );
              }
              }
            )
          ),
        ],
      ),
    );
  }
  Widget _buildSubscriptionModelList(ResponseData items) {
    return Card(
      child: ExpansionTile(
        title: Text(
          items.name.toString(),
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              items.validTo.toString(),
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

