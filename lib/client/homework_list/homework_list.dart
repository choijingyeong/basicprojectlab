import 'package:flutter/material.dart';

class HomeworkList extends StatelessWidget {
  final List<ButtonData> buttons = [
    ButtonData(
      title: 'Button 1',
      dateText: '2023. 12. 17 ~ 2023. 12. 25',
      isChecked: true,
    ),
    ButtonData(
      title: 'Button 2',
      dateText: '2023. 12. 27 ~ 2023. 12. 31',
      isChecked: false,
    ),
    ButtonData(
      title: 'Button 3',
      dateText: '2023. 12. 10 ~ 2023. 12. 20',
      isChecked: true,
    ),
    // 다른 버튼들도 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Buttons'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 버튼을 눌렀을 때 수행할 동작
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(buttons[index].title),
            subtitle: Text(buttons[index].dateText),
            trailing: buttons[index].isChecked
                ? Icon(Icons.check) // 원 안에 체크 표시
                : Icon(Icons.remove), // 원 안에 "-" 표시
            onTap: () {
              // 버튼을 눌렀을 때 수행할 동작
            },
          );
        },
      ),
    );
  }
}

class ButtonData {
  final String title;
  final String dateText;
  final bool isChecked;

  ButtonData({
    required this.title,
    required this.dateText,
    required this.isChecked,
  });
}