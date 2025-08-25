import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {

  final String userName;
  //final int userAge;

  const UserPage({
    super.key,
    required this.userName,
    //required this.userAge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("userName: $userName"),
          ),
          SizedBox(height: 10,),
          // Center(
          //   child: Text("userAge: $userAge"),
          // ),
        ],
      ),
    );
  }
}
