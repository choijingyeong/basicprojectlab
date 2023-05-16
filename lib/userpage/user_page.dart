import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';

final images = [
  'assets/images/milky.jpg',
  'assets/images/mont.jpg',
  'assets/images/tower.jpg',
  'assets/images/woman.jpg',
];

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  SideTitles get _bottom => SideTitles(
      showTitles: true,
      interval: 1.0,

      getTitlesWidget: (value, meta) {
        String text = '${value.toInt()}일';
        return Text(text);
      }

  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            elevation: 1.0,
            title: Text('RemindDiary', style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {  },
                color: Colors.black,
              ),
            ]
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text("감정 그래프", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              height: 250.0,
              width: 375.0,
              child: LineChart(
                LineChartData(
                    backgroundColor: Colors.black12,
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        left: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.transparent),
                        top: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      drawHorizontalLine: false,
                    ),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(sideTitles: _bottom),
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    minX: 14,
                    maxX: 19,
                    minY: 0,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            FlSpot(14,30),
                            FlSpot(15,40),
                            FlSpot(16,90),
                            FlSpot(17,50),
                            FlSpot(18, 20),
                            FlSpot(19, 40),
                          ]
                      )
                    ]
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
              ),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            )
                          ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          i,
                          fit:BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow:[ BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                    ],
                  ),
                  child: Center(
                    child: Text("봄", style: TextStyle(color: Colors.black, fontSize: 14,)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow:[ BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                    ],
                  ),
                  child: Center(
                    child: Text("벚꽃", style: TextStyle(color: Colors.black, fontSize: 14,)),
                  ),
                ),
              ],
            ),
            Container(
              child: Text("동학사에 가서 꽃구경을 했다.", style: TextStyle(color: Colors.black, fontSize: 16,)),
              margin: EdgeInsets.fromLTRB(100, 15, 100, 40),
            ),
          ], // childeren
        ),
      ),
    );
  }
}