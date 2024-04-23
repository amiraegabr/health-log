import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String title;

  const MedicineCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text("Time")),

                Text("Edit / delete"),

                // Container(
                //     decoration: BoxDeco60y0ration(
                //         border: Border.all,.ew(color: Colors.black, width: 2),
                //         borderRadius: BorderRadius.all(Radius.circular(5))),
                //     child: Icon(Icons.more_horiz_rounded))
                
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    child: Icon(Icons.more_horiz_rounded))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Medicine info"),

            SizedBox(
              height: 10,
            ),
            Text("Medicine info"),
          ],
        ),
      ),
    );
  }
}