
import 'package:flutter/material.dart';
import 'verfication.dart';

class forgetPass extends StatelessWidget {
  const forgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Enter your Email",
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF129A7F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 70.0,
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
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Container(
                constraints: const BoxConstraints.tightForFinite(
                  width: 300,
                  height: 60,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF129A7F),
                ),
                child: Container(
                  constraints: const BoxConstraints.tightForFinite(
                    width: 300,
                    height: 60,
                  ),

                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) => const verfication(),
                          ),
                        );
                      },
                      child: const Text(
                        'Send verfication code',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          // backgroundColor: Colors.orange,
                          // color: Colors.white,
                          // fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}