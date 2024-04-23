import 'package:flutter/material.dart';
import 'verification.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Enter your Email",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF129A7F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xFF129A7F),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).splashColor)),
                ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Verification(),
                        ),
                      );
                    },
                    child: const Text(
                      'Send Verification Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}