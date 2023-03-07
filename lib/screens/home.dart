import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/screens/login_screen.dart';

import '../components/under_part.dart';

class Home extends StatelessWidget {
    Home({Key? key}) : super(key: key);

    final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding : EdgeInsets.all(20.0),


          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             // const SizedBox(
             //  height: 15,
             //),
              //const SizedBox(
              //  height: 1,
              //),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Image.asset('assets/images/splash_3.png',
                    height: 200, width: 200),
              ),
//زر الادخال
          
              TextField(
                controller: _textController,

                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.top,
               decoration:  InputDecoration(

                  hintText:'Write your question here',
                  prefixIcon: Icon(Icons.search , size: 30.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: (){
                      _textController.clear();
                    },
                  ),
                  border:  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8)),
                 // suffixIcon: IconButton (
                    // onPressed: (){
                    //   _textController.clear();
                    // },
                    // icon: const  Icon(Icons.clear),
                  // ),
             ),

               // const SizedBox(
               // height: 95,),
              ),
               MaterialButton(onPressed: (){},
               color: Colors.blue,
                 child: const  Text('answer' ,style: TextStyle(color: Colors.white)),
               )
          ],
          ),
        ));
  }
}
