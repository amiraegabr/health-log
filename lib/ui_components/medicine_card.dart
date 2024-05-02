import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String title;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const MedicineCard({
    super.key,
    required this.title,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

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
                  child: Text("Time"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: onEditPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Icon(Icons.edit),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onDeletePressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("Medicine info"),
            const SizedBox(height: 10),
            Text("Medicine info"),
          ],
        ),
      ),
    );
  }
}
