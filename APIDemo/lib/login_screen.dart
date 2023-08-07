import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test1/dashboard_screen.dart';
import 'package:test1/subscriptionlist_screen.dart';
import 'color_constant.dart';
import 'Models/LoginModel.dart';
import 'package:test1/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<bool> login(String email, password) async
  {
    try{
       Response response = await post(
           Uri.parse('https://test.velospot.ch/customer/public/api/app/customerLogin'),
         body: {
             'pushNotificationToken':'f5of-Ps8eU_Jt5-zkD8LJG:APA91bF9bE8dMQ1Ic6TwXjMoEzViHkYwgvAw8KYgFlkF1J-dPyvNAwlMnLtuM7rQmoYOLhmpH5sT0fUTTcY-ADEKR407qoAwGJp0DePaU1mN_wTEQjSKBrN-dierF-_NrP7lzSZKGVeV',
           'simOperatorName':'',
           'simSerialNo':'',
           'deviceName':'',
           'deviceAndroidId':'',
           'deviceWifiMacId':'',
           'ipAddress':'',
           'os':'iOS',
           'appVersion':'2.5',
           'osVersion':'14.8',
           'platformType':'App-iOS',
           'deviceId':'A85452DF-719E-445B-BA9A-BF55FD4F6FE4MbikeCom',
           'loginType':'GEN',
           'customerEmail':email,
           'password':password,
           'locale': 'en'
         }
       );
       
       if(response.statusCode == 200)
         {
           var data = jsonDecode(response.body.toString());
           print(data);
           var loginResponse = LoginModel.fromJson(jsonDecode(response.body));
           if(loginResponse.responseStatus?.statuscode == '200')
             {
               print('logged in successfully');
               SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setString('customerId',loginResponse.responseData!.customerId.toString());
               prefs.setString('sessionId',loginResponse.responseData?.sessionId as String);
               prefs.setString('loggedIn','Y');
               return true;
             }
           else
             {
               print('logged in failed');
               return false;
             }

          // return true;
         }
       else
         {
           print('logged in failed');
           return false;
         }
    }
    catch(e)
    {
      print(e.toString());
      return false;
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('ONE LAST STEP LEFT BEFORE STARTING YOUR RIDE',style:TextStyle(color:ColorConstants.themeColor,fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/images/loginBg.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.grey), //<-- SEE HERE
                  ),
                  border: InputBorder.none,
                  hintText: 'Email address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,5,20,20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.grey), //<-- SEE HERE
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                child: Text('Login', style: TextStyle(fontSize: 18.0),),
                style: TextButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 40, 60),
                  foregroundColor: Colors.white,
                    backgroundColor: ColorConstants.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                onPressed: () async {
                  // emailController.text = "test4455@gmail.com";
                  // passwordController.text = "12345678";
                  var isLoggedin = login(emailController.text.toString(), passwordController.text.toString());
                  if(await isLoggedin)
                    {
                      _navigateToNextScreen(context);
                    }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,40,20,20),
              child: ElevatedButton(
                child: Text('Forgot your password?', style: TextStyle(fontSize: 18.0),),
                style: TextButton.styleFrom(
                  foregroundColor: ColorConstants.themeColor,
                    backgroundColor: Colors.transparent,
                    elevation: 0 //shadow
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,20),
              child: ElevatedButton(
                child: Text('Create a new account', style: TextStyle(fontSize: 18.0),),
                style: TextButton.styleFrom(
                    foregroundColor: ColorConstants.themeColor,
                    backgroundColor: Colors.transparent,
                    elevation: 0 //shadow
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
