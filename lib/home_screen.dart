import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:savings_number_cruncher/page/savings_page_one.dart';
import 'package:savings_number_cruncher/page/savings_page_two.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    SavingsPageOne(),
    SavingsPageTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      extendBody: true,
      body: IndexedStack(
        index: _selectedPage,
        children: _pageOptions,
      ),
      bottomNavigationBar: FloatingNavbar(
        key: Key('bottom_navigation_bar'),
        backgroundColor: Color(0xFF1a2133),
        items: <FloatingNavbarItem>[
          FloatingNavbarItem(
            icon: Icons.looks_one,
            title: 'Type 1',
          ),
          FloatingNavbarItem(
            icon: Icons.looks_two,
            title: 'Type 2',
          ),
        ],
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
          return index;
        },
      ),
    );
  }
}
