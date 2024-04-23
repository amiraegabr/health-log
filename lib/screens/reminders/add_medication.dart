import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});


  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  int _selectedDays = 1;
  int _selectedTimes = 1;
  String? value;
  String? option;
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<String> titles = [
    'GENERAL DETAILS',
    'PLANNING',
    'CONFIRM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD MEDICATIONS'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              //general details
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        //Med name
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Medicine Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            fillColor: const Color.fromRGBO(177, 221, 213, 1),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        //Med type
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Choose the medication type',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromRGBO(177, 221, 213, 1),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                RadioListTile(
                                    title: const Text('Capsule'),
                                    value: 'Capsule',
                                    groupValue: option,
                                    onChanged: (value) {
                                      setState(() {
                                        option = value;
                                      });
                                    }),
                                RadioListTile(
                                    title: const Text('Tablet'),
                                    value: 'Tablet',
                                    groupValue: option,
                                    onChanged: (value) {
                                      setState(() {
                                        option = value;
                                      });
                                    }),
                                RadioListTile(
                                    title: const Text('Liquid'),
                                    value: 'Liquid',
                                    groupValue: option,
                                    onChanged: (value) {
                                      setState(() {
                                        option = value;
                                      });
                                    }),
                                RadioListTile(
                                    title: const Text('Drops'),
                                    value: 'Drops',
                                    groupValue: option,
                                    onChanged: (value) {
                                      setState(() {
                                        option = value;
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        //button
                        Container(
                          constraints: const BoxConstraints.tightForFinite(
                            width: 200,
                            height: 40,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(255, 168, 115, 1),
                          ),
                          child: MaterialButton(
                              onPressed: () {
                                if (_currentIndex < 2) {
                                  _controller.animateToPage(
                                    _currentIndex + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //planning
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'HOW OFTEN ?',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(177, 221, 213, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //Picker
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'EVERY  $_selectedDays DAYS',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 125),
                              TextButton(
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // Return a Container with a CupertinoPicker
                                      return Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // Background color of the picker
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                          // Rounded corners
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: CupertinoPicker(
                                          itemExtent: 40,
                                          // Callback when the picker item changes
                                          onSelectedItemChanged: (index) {
                                            // Update selected days value
                                            setState(() {
                                              _selectedDays = index +
                                                  1; // Adding 1 as index starts from 0
                                            });
                                          },
                                          // Generate list of items for the picker
                                          children: List.generate(30, (index) {
                                            return Center(
                                              // Display numbers from 1 to 30 vertically
                                              child: Text(
                                                '${index + 1}',
                                                // Display numbers from 1 to 30
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'HOW MANY TIMES A DAY ?',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(177, 221, 213, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          //picker
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                ' $_selectedTimes TIMES PER DAY',
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 100),
                              TextButton(
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // Return a Container with a CupertinoPicker
                                      return Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // Background color of the picker
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                          // Rounded corners
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: CupertinoPicker(
                                          itemExtent: 40,
                                          // Callback when the picker item changes
                                          onSelectedItemChanged: (index) {
                                            // Update selected days value
                                            setState(() {
                                              _selectedTimes = index +
                                                  1; // Adding 1 as index starts from 0
                                            });
                                          },
                                          // Generate list of items for the picker
                                          children: List.generate(10, (index) {
                                            return Center(
                                              // Display numbers from 1 to 30 vertically
                                              child: Text(
                                                '${index + 1}',
                                                // Display numbers from 1 to 30
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      indent: 80,
                      endIndent: 80,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 80,),
                    Container(
                      constraints: const BoxConstraints.tightForFinite(
                        width: 200,
                        height: 40,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 168, 115, 1),
                      ),
                      child: MaterialButton(
                          onPressed: () {
                            if (_currentIndex < 2) {
                              _controller.animateToPage(
                                _currentIndex + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              //confirm
              Container(
                color: Colors.white,
              ),
            ],
          ),
          //dot indicator
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotColor: Color.fromRGBO(177, 221, 213, 1),
                          dotHeight: 16,
                          dotWidth: 35,
                          spacing: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      titles[_currentIndex],
                      style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}