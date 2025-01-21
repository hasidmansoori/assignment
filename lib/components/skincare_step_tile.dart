import 'package:flutter/material.dart';

class SkincareStepTile extends StatelessWidget {
  final String step;
  final String product;
  final String time;

  SkincareStepTile({
    required this.step,
    required this.product,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Color(0xFFFDE7F0), // Light pink background
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.check, // Checkmark icon
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(step),
        subtitle: Text(product),
        trailing: Text(time),
      ),
    );
  }
}
