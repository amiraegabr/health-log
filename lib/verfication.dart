import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'login.dart';


class verfication extends StatelessWidget {
  const verfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Enter verfication code",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF129A7F),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                //PinCodeFields(onComplete: onComplete),


                PinCodeTextField(
                  pinBoxWidth: 45,
                  pinBoxRadius: 10,
                  highlight: true,
                  highlightAnimation: true,
                  maxLength: 6,
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: const Color(0xFF129A7F),
                  onTextChanged :(value){
                    print(value);
                  } ,

                ),
                const SizedBox(
                  height: 40.0,
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Color(0xFF129A7F),
                        fontSize: 27,

                      ),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 5,
                  color: Color(0xFF129A7F),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
