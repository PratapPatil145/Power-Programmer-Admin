

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}


class _InsertDataState extends State<InsertData> {
  @override
  TextEditingController ProgramNameController = TextEditingController();
  TextEditingController CodeController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Page"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            getTextField(hint: "Program Name",Controller: ProgramNameController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            getTextField(hint: "Program Code",Controller: CodeController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
           
            Container(
              color: Colors.amber,
              child: TextButton(
                onPressed: () {
                  insertNewData();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                ),
                child: const Text(
                  'SEND',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          //   print(CodeController),
          ],
        ),
      )),
    );
  }
   
  Future<http.Response>insertNewData()async{
    final http.Response response = await http.post(Uri.parse('https://8d0d-103-121-153-80.in.ngrok.io/programs'),
  headers: <String,String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String, String>{
      'name': ProgramNameController.text,
      'code': CodeController.text,
      'status':"1"
    }),
   
  );
  print(response.statusCode);
 
 return response;

}
      
}

Widget getTextField({required String hint, required  Controller}) {
  return TextField(
    controller: Controller,
    decoration: InputDecoration(
        hintText: hint, fillColor: Colors.grey, focusColor: Colors.grey),
  );
}





