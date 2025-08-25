import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/pages/age_page.dart';
import 'package:go_router_project/pages/child_page.dart';
import 'package:go_router_project/pages/home_page.dart';
import 'package:go_router_project/pages/login_page.dart';
import 'package:go_router_project/pages/profile_page.dart';
import 'package:go_router_project/pages/user_page.dart';
import 'package:go_router_project/router/route_names.dart';

import '../data/user.dart';
import '../pages/back_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage<dynamic>(
        child: Scaffold(body: Center(child: Text("This Page Not Found"))),
      );
    },

    ///redirect to login page if user is not logged In
    // redirect: (context, state){
    //   bool isUserLoggedIn = UserData.isUserLoggedIn;
    //   if(isUserLoggedIn) {
    //     return "/";
    //   } else {
    //       return "/login";
    //   }
    // },

    routes: [
      ///Home Page
      GoRoute(
        name: "Home",
        path: "/",
        builder: (context, state) {
          return const HomePage();
        },
      ),

      ///Profile Page
      GoRoute(
        name: RouteNamesClass.profile,
        path: "/profile",
        builder: (context, state) {
          return const ProfilePage();
        },
        routes: [
          GoRoute(
            name: "Child",
            path: "/child",
            builder: (context, state) {
              return const ChildPage();
            },
          ),
        ],
      ),

      ///User Page (Extra Parameter)
      // GoRoute(
      //     path: "/user",
      //   builder: (context, state) {
      //
      //       final name = (state.extra as Map<String, dynamic>) ["name"] as String;
      //       final age = (state.extra as Map<String, dynamic>) ["age"] as int;
      //
      //       return UserPage(
      //         userName: name,
      //         userAge: age,
      //       );
      //   }
      // ),

      ///User Page (Path Parameter)
      GoRoute(
          path: "/user/:name",
        builder: (context, state){
            return UserPage(
                userName: state.pathParameters['name']!,
                //userAge: state.pathParameters['age']!!,
            );
        }
      ),

      ///(Query Parameter)
      GoRoute(
        path: "/age",
        name: RouteNamesClass.age,
        builder: (context, state){
          final int age = state.uri.queryParameters['age'] == null ? 0
              : int.parse(state.uri.queryParameters['age']!);
          return AgePage(age: age);
        }
      ),

      ///Login Page
      GoRoute(
          path: "/login",
        builder: (context, state){
            return LoginPage();
        }
      ),

      GoRoute(
          path: "/back",
          builder: (context, state){
            return BackPage();
          }
      ),

    ],
  );
}
