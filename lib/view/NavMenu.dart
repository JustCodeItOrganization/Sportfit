import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/pageone.dart';
import 'package:flutter_application_2/view/pagetwo.dart';
import 'package:flutter_application_2/view/pagefour.dart';
import 'package:flutter_application_2/view/pagefive.dart';
import 'package:flutter_application_2/view/pagethree.dart';
import 'package:flutter_application_2/view/home_view.dart';
import 'package:flutter_application_2/view/input_module_view.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Deneme'),
            accountEmail: Text('Deneme'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network('https://images.unsplash.com/photo-1622977265115-cce36eb43f18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1626252346582-c7721d805e0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGd5bSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favs'),
            onTap: () => print('FavSSSSSSSSSS'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('PageOne'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageOne())
            );
          },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Input Module'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => InputModuleView())
            );
          },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('PageThree'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageThree())
            );
          },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('PageFour'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageFour())
            );
          },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('PageFive'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageFive())
            );
          },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('HomeView'),
            onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeView())
            );
          },
          ),
        ],
      )
    );
  }
}