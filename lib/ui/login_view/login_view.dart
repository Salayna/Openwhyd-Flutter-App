import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Openwhyd", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid
                    )
                ),
                hintText: "username",
              ),
            ),
            TextField(
              controller: _passwordController,

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid
                  )
                ),
                hintText: "password"
              ),
            ),
            TextButton(onPressed: ()=>{}, child: Text("Login"))
          ],
        ),
      )
    );
  }
}