import 'dart:convert';
import 'dart:typed_data';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/Common/common.dart';
import 'package:test1/Models/TicketModel.dart';
import 'Header/header.dart';
import 'color_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  TextEditingController bikeIdController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  var _category = ['Wheels', 'Framework', 'Lock', 'brake'];
  String _categoryvalue = 'Wheels';
  File? galleryFile;
  final picker = ImagePicker();
  String base64String = '';
  String photoExt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SafeArea(
        left: false,
        top: true,
        right: false,
        bottom: true,
        minimum: const EdgeInsets.only(top: 16,bottom: 16),
    child:
        SingleChildScrollView(
        child:
        Container(
      color: ColorConstants.backgroundColor,
      child: Column(
        children: [
          header(),
          Padding(
            padding: EdgeInsets.all(30.0),
            child:
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      Expanded(
                          child:
                          Center(
                            child: Text(
                              'Ticket',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          )
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Please report any problem related to your bike',
                        textAlign: TextAlign.left),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: textBoxDecoration(),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      value: _categoryvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: _category.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          _categoryvalue = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: textBoxDecoration(),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: TextField(
                      controller: bikeIdController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Bike ID'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: Text('Where do i find the bike Id?', style: TextStyle(fontSize: 14.0),),
                      style: TextButton.styleFrom(
                          foregroundColor: ColorConstants.themeColor,
                          backgroundColor: Colors.transparent,
                          elevation: 0 //shadow
                      ),
                      onPressed: () {
                        showAlertDialog(context,false,"OK","","Alert","On the bike lock");
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: textBoxDecoration(),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      maxLength: null,
                      maxLines: null,
                      controller: commentController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Enter your comments'),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 5),
                        Text('Attach Photo', style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        fixedSize: Size(200,50),
                        backgroundColor: Colors.transparent,
                        elevation: 0 ,//shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.black,
                        )
                    ),
                    onPressed: () {
                      _showPicker(context: context);
                    },
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: galleryFile == null ? 10: 200,
                    child: galleryFile == null
                        ? null
                        : Center(child: Image.file(galleryFile!)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('SEND', style: TextStyle(fontSize: 18.0),),
                    style: TextButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width - 40, 60),
                      foregroundColor: Colors.white,
                      backgroundColor: ColorConstants.themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    onPressed: () async {
                      ticketSubmitAPI();
                    },
                  )
                ],
              ),
          ),
        ],
      ),
    ))));
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future getImage(
      ImageSource img,
      ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
          () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
          photoExt = p.extension(pickedFile!.path);
          print(photoExt);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
  ImagetoBase64() async {

    // Read bytes from the file object
    Uint8List _bytes = await galleryFile!.readAsBytes();

    // base64 encode the bytes
    String _base64String = base64.encode(_bytes);
    setState(() {
      base64String = _base64String;
    });
  }

  BoxDecoration textBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        width: 1, //
        color: Colors.black26, //                 <--- border width here
      ),
    );
  }

  void ticketSubmitAPI() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? customerId = prefs.getString('customerId');
    String? sessionId = prefs.getString('sessionId');
    try{
      Response response = await post(
          Uri.parse('https://test.velospot.ch/customer/public/api/app/customerSubmitTicket'),
          body: {
            'os':'iOS',
            'appVersion':'2.5',
            'osVersion':'14.8',
            'platformType':'App-iOS',
            'sessionId': sessionId,
            'customerId':customerId,
            'networkId':'18',
            'photo':base64String,
            'locale': 'en',
            'category':_categoryvalue,
            'lockNumber':bikeIdController.text.toString(),
            'remarks':commentController.text.toString(),
            'photoExt':photoExt
          }
      );

      if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());
        print(data);
        var loginResponse = TicketModel.fromJson(jsonDecode(response.body));
        if(loginResponse.responseStatus?.statuscode == '200')
        {
          print('logged in successfully');
          // showAlertDialog(context);
        }
        else
        {
          print('logged in failed');
        }

        // return true;
      }
      else
      {
        print('logged in failed');

      }
    }
    catch(e)
    {
      print(e.toString());

    }
  }
}
