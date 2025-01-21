import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StreakScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Changed to white
        elevation: 0,
        title: Text(
          'Streaks',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Goal: 3 streak days",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity, // Full width of the screen
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF2E8EB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'Streak Days',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Daily Streak',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '2',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Last 30 Days',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+100%',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                height: 150, // Reduced graph height
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 2),
                          FlSpot(1, 1.5),
                          FlSpot(2, 2.5),
                          FlSpot(3, 1.8),
                          FlSpot(4, 3),
                          FlSpot(5, 2.7),
                        ],
                        isCurved: true,
                        color: Colors.pink,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Keep it up! You're on a roll.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF2E8EB), // Changed to #c3c3c3
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
