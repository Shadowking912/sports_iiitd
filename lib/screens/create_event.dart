import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sports_iiitd/common/CustomAppbar.dart';
import 'package:sports_iiitd/services/models.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../services/db.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final Event? event = ModalRoute.of(context)!.settings.arguments as Event?;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        color: Colors.black,
        child: Column(
          children: [
            customAppBar("CREATE EVENT", context, logo: true, goBack: true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        labelText: 'Event Name',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: event?.name ?? '',
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      decoration: InputDecoration(
                        labelText: 'Event Date',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: event?.date,
                    ),
                    FormBuilderTextField(
                      name: 'location',
                      decoration: InputDecoration(
                        labelText: 'Event Location',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: event?.location ?? '',
                    ),
                    FormBuilderDropdown(
                      name: 'sport',
                      items: sportsList
                          .map((sport) => DropdownMenuItem(
                              value: sport, child: Text(sport)))
                          .toList(),
                      decoration: InputDecoration(labelText: 'Sport'),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()],
                      ),
                      initialValue: event?.sport ?? '',
                    ),
                    FormBuilderTextField(
                      name: 'description',
                      decoration: InputDecoration(
                        labelText: 'Event Description',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      initialValue: event?.description ?? '',
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Event eventForm =
                              Event.fromJson(_formKey.currentState!.value);
                          if (event != null) {
                            eventForm.id = event.id;
                            await editEvent(eventForm);
                            Navigator.pop(context, eventForm);
                          } else {
                            eventForm.id = await createEvent(eventForm);
                            Navigator.pop(context, eventForm);
                          }
                        }
                      },
                      child: Text(event == null ? 'Create' : 'Update'),
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
