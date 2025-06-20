import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:cookbook/CreatePage.dart';

class navPages extends StatefulWidget {
  const navPages({super.key});

  @override
  State<navPages> createState() => _navPagesState();
}

class _navPagesState extends State<navPages> {
  int _currentIndex = 0;

  final List<Widget> pages = [Homepage(), createPage()];

  void _onNavPageTapped(int index) {
    Navigator.of(context).maybePop();
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF8A9A74),
        currentIndex: _currentIndex,
        onTap: _onNavPageTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home", ),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Create Recipe",),

        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
