import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../services/auth.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _user = getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: 'Name',
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: _user!.displayName,
              ),
              FormBuilderTextField(
                name: 'Roll',
                decoration: InputDecoration(labelText: 'Roll'),
                // regex to get numeric part of email
                initialValue: '20' + _user!.email!.split(RegExp(r'\D+')).join(),
              ),
              SizedBox(height: 16.0),
              Text('Branch'),
              FormBuilderDropdown(
                name: 'Branch',
                items: ['CSE', 'ECE', 'CSAM', 'CSB', 'CSSS', 'CSAI', 'CSD']
                    .map(
                      (branch) => DropdownMenuItem(
                        value: branch,
                        child: Text(branch),
                      ),
                    )
                    .toList(),
              ),
              FormBuilderTextField(
                name: 'Email',
                decoration: InputDecoration(labelText: 'Email'),
                initialValue: _user!.email,
              ),
              FormBuilderTextField(
                name: 'Phone',
                decoration: InputDecoration(labelText: 'Phone'),
                initialValue: _user!.phoneNumber,
              ),
              
              SizedBox(height: 16.0),
              Text('Favourite Sport'),
              FormBuilderDropdown(name: 'Favourite Sport', items: [
                'Cricket',
                'Football',
                'Basketball',
                'Volleyball',
                'Badminton',
                'Tennis',
                'Table Tennis',
                'Hockey',
                'Chess',
              ].map((sport) => DropdownMenuItem(value: sport, child: Text(sport))).toList()),
              // elevated button to signout
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await signOut();
                      Navigator.of(context).pushReplacementNamed('/sign_in');
                    },
                    child: Text('Sign out'),
                  ),
                  ElevatedButton(
                    onPressed: ()  {
                      // await signOut();
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
