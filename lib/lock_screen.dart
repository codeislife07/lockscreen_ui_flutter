import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {


  var keyboardText=[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "Clear",
    "0",
    "Back",
  ];
  TextEditingController pinConntroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Pinput(
            controller: pinConntroller,
            readOnly: true,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s) {
              if(s=="1234"){
                Navigator.pop(context);
              }
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          SizedBox(height: 200,),
          Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(keyboardText.length, (index)
              => GestureDetector(
                onTap: (){
                  if(index==9){
                    pinConntroller.text="";
                  return ;
                  }
                  if(index==11){
                    pinConntroller.text=pinConntroller.text.substring(0,pinConntroller.text.length-1);
                    return ;
                  }
                  if(pinConntroller.length>4){

                  }else{
                    pinConntroller.text+=keyboardText[index];
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Center(child: Text(keyboardText[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),
              )),
            ),
          ),
          SizedBox(height: 30,)

        ],
      ),
    );
  }
}
