import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';

final images = [
  'assets/images/milky.jpg',
  'assets/images/mont.jpg',
  'assets/images/tower.jpg',
  'assets/images/woman.jpg',
];

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                )
              ]
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2023, 01, 01),
                  lastDay: DateTime.utc(2023, 12, 31),
                  focusedDay: DateTime.now(),
                  eventLoader: (day){
                    if(day.day==5) {
                      return ['event'];
                    }
                    return [];
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    markerDecoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/images/tower.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    markerSize: 40.0,
                    markersAlignment: Alignment.topCenter,
                    outsideDaysVisible: false,
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
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
              )
            ],
          ),
        )
    );
  }
}