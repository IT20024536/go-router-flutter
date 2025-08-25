import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/route_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "Home Page",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                //GoRouter.of(context).go("/profile");

                ///name_route_path
                GoRouter.of(context).goNamed(RouteNamesClass.profile);

              },
              child: Text("Go to Profile"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                GoRouter.of(context).go("/profile/child");
              },
              child: Text("Go to Child"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                // GoRouter.of(context).go(
                //   "/user",
                //   extra: {
                //     "name": "Mana",
                //     "age": 20,
                //   },
                // );

                String name = "Mana";
                GoRouter.of(context).go("/user/$name");
              },
              child: Text("Go to User Page"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                ///query parameter
                GoRouter.of(context).goNamed(
                  RouteNamesClass.age,
                  queryParameters: {
                    "age": "24"
                  }
                );
              },
              child: Text("Go to Age Page"),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed: (){
                GoRouter.of(context).push("/back");
              },
              child: Text("Go to Back Page"),
          ),
        ],
      ),
    );
  }
}
