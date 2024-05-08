import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  final String title;
  final String subtitle;
  final leading;

  const ProfileCards({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Theme.of(context).cardColor,
      child: ListTile(
        // onTap: (){},
        iconColor: Theme.of(context).primaryColor,
        titleTextStyle: const TextStyle(color: Colors.black ,fontSize: 20, fontWeight: FontWeight.w400),
        leading: Container(
          padding: EdgeInsets.zero,
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            // color: Theme.of(context).cardColor,
            // color: Colors.green,
              borderRadius: BorderRadius.circular(20)),

          child: leading,
        ),
        title: Text(
          title,),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}