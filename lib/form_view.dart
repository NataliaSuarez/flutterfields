import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterfields/common/camera_field.dart';
import 'package:flutterfields/common/custom_text_field.dart';
import 'package:flutterfields/common/date_picker_field.dart';
import 'package:flutterfields/common/map_view_button.dart';
import 'package:flutterfields/common/sf_date_picker_field.dart';
import 'package:open_location_picker/open_location_picker.dart';

class FormView extends StatefulWidget {
  CameraDescription camera;

  FormView({super.key, required this.camera});

  @override
  FormViewState createState() => FormViewState();
}

class FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormViewState>();

  @override
  Widget build(BuildContext context) {
    // return CameraField(camera: widget.camera);
    return Form(
      key: _formKey,
      child: SizedBox.expand(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextField(valor: 'something'),
          DatePickerField(valor: 'something'),
          const SfDatePickerField(),
          const MapViewButton(),
          OpenMapPicker(
            decoration: const InputDecoration(
              hintText: "My Location",
            ),
            onSaved: (FormattedLocation? newValue) {
              /// save new value
            },
          ),
          ElevatedButton(onPressed: () => {}, child: const Text('Open Camera'))
        ],
      )),
    );
  }
}
