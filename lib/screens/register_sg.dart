import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/services/models.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../services/db.dart';

class CreateSG extends StatefulWidget {
  @override
  _CreateSGState createState() => _CreateSGState();
}

class _CreateSGState extends State<CreateSG> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final SG? sg = ModalRoute.of(context)!.settings.arguments as SG?;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar("CREATE SG", context, logo: true, goBack: true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        labelText: 'SG Name',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: sg?.name ?? '',
                    ),
                    FormBuilderDateTimePicker(
                      name: 'deadline',
                      inputType: InputType.date,
                      decoration: InputDecoration(
                        labelText: 'Deadline Date',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: sg?.deadline,
                    ),
                    FormBuilderTextField(
                      name: 'credits',
                      decoration: InputDecoration(
                        labelText: 'SG Credits',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: sg?.name ?? '',
                    ),
                    FormBuilderTextField(
                      name: 'mentor',
                      decoration: InputDecoration(
                        labelText: 'SG Mentor',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: sg?.name ?? '',
                    ),
                    // FormBuilderDropdown(
                    //   name: 'sport',
                    //   items: sportsList
                    //       .map((sport) => DropdownMenuItem(
                    //           value: sport, child: Text(sport)))
                    //       .toList(),
                    //   decoration: InputDecoration(labelText: 'Sport'),
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //   ),
                    //   validator: FormBuilderValidators.compose(
                    //     [FormBuilderValidators.required()],
                    //   ),
                    //   initialValue: sg?.sport ?? '',
                    // ),
                    FormBuilderTextField(
                      name: 'description',
                      decoration: InputDecoration(
                        labelText: 'SG Description',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: sg?.description ?? '',
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          SG sgForm = SG.fromJson(
                            _formKey.currentState!.value);
                          sgForm.id = await createSG(sgForm);
                          Navigator.pop(context, sgForm);
                        }
                      },
                      child: Text(sg == null ? 'Create' : 'Update'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
