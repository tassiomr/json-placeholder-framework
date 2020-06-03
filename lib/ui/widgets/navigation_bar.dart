import 'package:flutter/material.dart';
import 'package:framework_desafio/ui/pages/posts.dart';
import 'package:framework_desafio/ui/pages/albums.dart';
import 'package:framework_desafio/ui/pages/todos.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    PostsList(),
    AlbumsList(),
    TodoList(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json Placeholder")),
      body: Center(
        child: _widgetOptions.elementAt(this._selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.textsms),
            title: Text('Posts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subtitles),
            title: Text('Albums'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_pin),
            title: Text('Todos'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: this._onTapped,
      ),
    );
  }
}
