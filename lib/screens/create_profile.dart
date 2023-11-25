import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../services/auth.dart';
import '../services/db.dart';
import '../services/models.dart';

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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  name: 'Name',
                  decoration: InputDecoration(labelText: 'Name'),
                  initialValue: _user!.displayName,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(50),
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'Roll',
                  decoration: InputDecoration(labelText: 'Roll'),
                  // regex to get numeric part of email
                  initialValue:
                      '20' + _user.email!.split(RegExp(r'\D+')).join(),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.minLength(7),
                      FormBuilderValidators.maxLength(7),
                    ],
                  ),
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
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'Email',
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: _user.email,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'Phone',
                  decoration: InputDecoration(labelText: 'Phone'),
                  initialValue: _user.phoneNumber,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.minLength(10),
                      FormBuilderValidators.maxLength(10),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Batch'),
                FormBuilderDropdown(
                  name: 'Batch',
                  items: [
                    '2020',
                    '2021',
                    '2022',
                    '2023',
                    'M.Tech 2022',
                    'M.Tech 2023',
                    'PhD'
                  ]
                      .map((batch) =>
                          DropdownMenuItem(value: batch, child: Text(batch)))
                      .toList(),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text('Favourite Sport'),
                FormBuilderDropdown(
                  name: 'Favourite Sport',
                  items: sportsList
                      .map((sport) =>
                          DropdownMenuItem(value: sport, child: Text(sport)))
                      .toList(),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
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
                      onPressed: () async {
                        // await signOut();
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.saveAndValidate()) {
                          Student student =
                              Student.fromJson(_formKey.currentState!.value);
                          print(student.toJson());
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Creating student document'),
                                content: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                            barrierDismissible: false,
                          );
                          await createStudentDocument(student);
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                        // Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
