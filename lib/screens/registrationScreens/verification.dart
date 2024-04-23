import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'login.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const SizedBox(
            //   height: 100,
            // ),
            const Text(
              "Enter verification code",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF129A7F),
                fontWeight: FontWeight.w600,
              ),
            ),

            //PinCodeFields(onComplete: onComplete),
            PinCodeTextField(
              pinBoxWidth: 45,
              pinBoxRadius: 10,
              highlight: true,
              // highlightAnimation: true,
              maxLength: 6,
              defaultBorderColor: const Color(0xFF129A7F),
              highlightColor: const Color(0xFFFFA873),
              hasTextBorderColor: const Color(0xFFFFA873),
              onTextChanged :(value){
                print(value);
              } ,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF129A7F),
              ),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  const Login()));
                  },
                  child: const Text(
                    'CONFIRM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}