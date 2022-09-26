import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  String valor = "";
  DateTime dateTime = DateTime.now();

  DatePickerField({required this.valor, super.key});

  @override
  Widget build(BuildContext context) {
    Future<DateTime?> pickDate() => showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2010),
          lastDate: DateTime(2030),
          builder: (context, dialog) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: const Color(0xFF00787A),
                textTheme: const TextTheme(
                  headline4: TextStyle(fontFamily: 'Montserrat'),
                  overline: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                  button: TextStyle(fontFamily: 'Montserrat'),
                  caption: TextStyle(fontFamily: 'Montserrat'),
                  subtitle1: TextStyle(fontFamily: 'Montserrat'),
                ),
                colorScheme:
                    const ColorScheme.light(primary: Color(0xFF00787A)),
                dialogTheme: DialogTheme(
                    titleTextStyle: const TextStyle(fontFamily: 'Montserrat'),
                    contentTextStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(16),
                    )),
                buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: dialog!,
            );
          },
        );

    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(child: TextField(
        onChanged: (texto) {
          valor = texto;
        },
      )),
      ElevatedButton(
          onPressed: () async {
            final date = await pickDate();
            if (date == null) return;
          },
          child: const Text('Select Date',
              style: TextStyle(fontFamily: 'Montserrat'))),
    ]);
  }
}
