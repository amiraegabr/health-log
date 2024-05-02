import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});

  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _pageTitles = ['General Details', 'Planning', 'Confirm'];

  // General Details
  final _medicineNameController = TextEditingController();
  String? _medicineType;

  // Planning
  final _daysController = TextEditingController();
  final _timesController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _medicineNameController.dispose();
    _daysController.dispose();
    _timesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD MEDICATIONS'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                _GeneralDetails(),
                _Planning(),
                _Confirm(),
              ],
            ),
          ),
          _DotIndicator(),
        ],
      ),
    );
  }
}

class _GeneralDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 60),
          //Med name
          TextField(
            controller: _medicineNameController,
            decoration: InputDecoration(
              hintText: 'Medicine Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: const Color.fromRGBO(177, 221, 213, 1),
              filled: true,
            ),
          ),
          const SizedBox(height: 35),
          //Med type
          const Text(
            'Choose the medication type',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromRGBO(177, 221, 213, 1),
            ),
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Capsule'),
                  value: 'Capsule',
                  groupValue: _medicineType,
                  onChanged: (value) {
                    setState(() {
                      _medicineType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Tablet'),
                  value: 'Tablet',
                  groupValue: _medicineType,
                  onChanged: (value) {
                    setState(() {
                      _medicineType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Liquid'),
                  value: 'Liquid',
                  groupValue: _medicineType,
                  onChanged: (value) {
                    setState(() {
                      _medicineType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Drops'),
                  value: 'Drops',
                  groupValue: _medicineType,
                  onChanged: (value) {
                    setState(() {
                      _medicineType = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Planning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 80),
          // Days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'HOW OFTEN ?',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select Days'),
                        content: CupertinoPicker(
                          itemExtent: 40,
                          onSelectedItemChanged: (value) {
                            _daysController.text = (value + 1).toString();
                          },
                          children: List.generate(30, (index) {
                            return Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Obx(
                      () => Text(
                        _daysController.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Times
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'HOW MANY TIMES A DAY ?',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select Times'),
                        content: CupertinoPicker(
                          itemExtent: 40,
                          onSelectedItemChanged: (value) {
                            _timesController.text = (value + 1).toString();
                          },
                          children: List.generate(10, (index) {
                            return Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 100,
                  child: Center(
                    child: Obx(
                      () => Text(
                        _timesController.text,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Confirm'),
      ),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.orange,
            dotColor: Color.fromRGBO(177, 221, 213, 1),
            dotHeight: 16,
            dotWidth: 35,
            spacing: 24,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          _pageTitles[_currentPage],
          style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
