import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:openwhyd_app/models/user_model.dart';
class UserProvider {
 Future<User> getprofile() async {

   final response = await http.get(
   Uri.https('openwhyd.org', 'api/user/adrien')
   );
   if(response.statusCode == 200){
     //print(User.fromJson(jsonDecode(response.body)));
     return User.fromJson(jsonDecode(response.body));
   } else {
    throw Exception('Failed');
   }
 }
}