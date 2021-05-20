import 'package:flutter/material.dart';
import 'package:openwhyd_app/constants/route_names.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, RouteNames.login);
          },
          child: Text("Main page")),
    );
  }
}
