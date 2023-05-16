import 'package:flutter/material.dart';

class Feelings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Perform action when back button is pressed
          },
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Perform action when menu button is pressed
            },
            color: Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final category = categoryList[index];
          return GestureDetector(
            onTap: () {
              print('selected');
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
                  width: 350,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // 투명한 배경색
                    border: Border.all(color: category.color),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 37.0,
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category.color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final Color color; // 카테고리의 색상 추가

  Category(this.name, this.color);
}

final List<Category> categoryList = [
  Category('화남', Colors.red), // 각 카테고리에 적절한 색상을 할당
  Category('신남', Colors.green),
  Category('기쁨', Colors.yellow),
  Category('즐거움', Colors.blue),
  Category('슬픔', Colors.purple),
];