import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/skincare_step_tile.dart';

class SkincareRoutineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Daily Skincare', style: TextStyle(fontSize: 20)),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('SkinCare').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No skincare steps available.'));
          }

          final steps = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final stepData = steps[index].data() as Map<String, dynamic>;
              return SkincareStepTile(
                step: stepData['step'] ?? 'Unknown Step',
                product: stepData['product'] ?? 'Unknown Product',
                time: stepData['time'] ?? 'Unknown Time',
              );
            },
          );
        },
      ),
    );
  }
}
