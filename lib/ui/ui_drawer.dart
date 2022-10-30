import 'package:flutter/material.dart';

class UIDrawer extends StatelessWidget {
  const UIDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          ListTile(
            title: Center(
              child: Text("Team", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
          ),
          ListTile(
            title: Text("Elvis Edson Basilio Chambi"),
            subtitle: Text("elvis.2e3@gmail.com"),
          ),
        ],
      ),
    );
  }
}
