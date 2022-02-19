import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model/user_profile.model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<UserProfileModel?>(
          future: getUserProfile(),
          builder: (BuildContext context, AsyncSnapshot<UserProfileModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return snapshot.data == null ? const Text('Yo bro i ain vdfjvd') : _getProfile(snapshot.data!);
            }

            // return something while loading
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<UserProfileModel?> getUserProfile() async {
    UserProfileModel? model;
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      model = UserProfileModel.fromJson(data[0] as Map<String, dynamic>);

      return model;
    }

    return model;
  }

  Card _getProfile(UserProfileModel userProfileModel) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 400,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/images/doe.jpg'),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(userProfileModel.username),
          ),

          //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Email: ${userProfileModel.email}',
              style: const TextStyle(color: Colors.black26),
            ),
          )
        ],
      ),
    );
  }
}
