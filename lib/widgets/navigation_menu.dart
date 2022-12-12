import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home_page_view.dart';
import 'package:flutter_application_2/view/page_cardio_view.dart';
import 'package:flutter_application_2/view/page_diet_view.dart';
import 'package:flutter_application_2/view/page_profile_view.dart';
import 'package:flutter_application_2/view/page_workout_view.dart';
import 'package:flutter_application_2/view/pagefive_old.dart';
import 'package:flutter_application_2/widgets/navigation_page.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text('Ali Veli'),
          accountEmail: Text('aliveli@mail.com'),
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
          navMenuPageName: "Ana Sayfa",
          navMenuPageView: PageHomeView(),
          navMenuIcon: Icon(Icons.home),
        ),
        const NavMenuPage(
          navMenuPageName: "Profil Sayfası",
          navMenuPageView: PageProfileView(),
          navMenuIcon: Icon(Icons.person),
        ),
        const NavMenuPage(
          navMenuPageName: "Antrenman Sayfası",
          navMenuPageView: PageWorkoutView(),
          navMenuIcon: Icon(Icons.sports),
        ),
        const NavMenuPage(
          navMenuPageName: "Diyet Sayfası",
          navMenuPageView: PageDietView(),
          navMenuIcon: Icon(Icons.food_bank),
        ),
        const NavMenuPage(
          navMenuPageName: "Kardiyo Sayfası",
          navMenuPageView: PageCardioView(),
          navMenuIcon: Icon(Icons.heart_broken),
        ),
        const NavMenuPage(
          navMenuPageName: "PageFive",
          navMenuPageView: PageFive(),
          navMenuIcon: Icon(Icons.heart_broken),
        ),
        //Divider(),
        //const NavMenuPage(
        //    navMenuPageName: "HomeView", navMenuPageView: HomeView()),
      ],
    ));
  }
}
