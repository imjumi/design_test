import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기숙사매칭프로토타입',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    MatchingScreen(),
    ChatingScreen(),
    MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기숙사매칭프로토타입'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.handshake_o),
            label: 'Matching',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialIcons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialIcons.person),
            label: 'MyPage',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class MatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('매칭'),
    );
  }
}

class ChatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('채팅'),
    );
  }
}

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이 페이지'),
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 20),
          Text(
            '마이 페이지',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            children: [
              _buildTableRow('성별', '남'),
              _buildTableRow('나이', '23세'),
              _buildTableRow('학과', '컴퓨터공학과'),
              _buildTableRow('흡연여부', '비흡연'),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
