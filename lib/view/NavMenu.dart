import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view/pageProfile.dart';
import 'package:flutter_application_2/view/pageDiet.dart';
import 'package:flutter_application_2/view/pageCardio.dart';
import 'package:flutter_application_2/view/pageWorkout.dart';
import 'package:flutter_application_2/view_model/navMenuPageModel.dart';
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
              child: Image.network(
                'https://images.unsplash.com/photo-1622977265115-cce36eb43f18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1626252346582-c7721d805e0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGd5bSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover)),
        ),
        const NavMenuPage(
            navMenuPageName: "HomePageView", navMenuPageView: HomePageView()),
        const NavMenuPage(
            navMenuPageName: "pageProfile", navMenuPageView: PageProfileView()),
        const NavMenuPage(
            navMenuPageName: "PageWorkout", navMenuPageView: PageWorkoutView()),
        const NavMenuPage(
            navMenuPageName: "PageDiet", navMenuPageView: PageDietView()),
        const NavMenuPage(
            navMenuPageName: "PageCardio", navMenuPageView: PageCardioView()),
        //Divider(),
        //const NavMenuPage(
        //    navMenuPageName: "HomeView", navMenuPageView: HomeView()),
      ],
    ));
  }
}
