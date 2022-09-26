import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SfDatePickerField extends StatefulWidget {
  const SfDatePickerField({super.key});

  @override
  SfDatePickerFieldState createState() => SfDatePickerFieldState();
}

/// State for MyApp
class SfDatePickerFieldState extends State<SfDatePickerField> {
  bool _isOpen = false;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        print(args.value);
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dialog = Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: 272,
          width: 328,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: SfDateRangePicker(
              backgroundColor: Colors.white,
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              monthFormat: 'MMM',
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 3))),
              rangeSelectionColor: const Color(0xFF34B1B5),
              rangeTextStyle: const TextStyle(color: Colors.white),
              selectionColor: const Color(0xFF00787A),
              selectionTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
              monthViewSettings: const DateRangePickerMonthViewSettings(
                dayFormat: 'EEE',
                firstDayOfWeek: 1,
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Color(0xFF869C9D),
                )),
              ),
              monthCellStyle: const DateRangePickerMonthCellStyle(
                textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF00787A),
                    fontWeight: FontWeight.w500),
              ),
              startRangeSelectionColor: const Color(0xFF00787A),
              endRangeSelectionColor: const Color(0xFF00787A),
              yearCellStyle: const DateRangePickerYearCellStyle(
                  todayTextStyle: TextStyle(
                      fontFamily: 'Montserrat', color: Color(0xFF00787A)),
                  leadingDatesTextStyle: TextStyle(
                      fontFamily: 'Montserrat', color: Color(0xFF869c9d)),
                  disabledDatesTextStyle: TextStyle(
                      fontFamily: 'Montserrat', color: Color(0xFF869c9d)),
                  textStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF869C9D),
                  )),
              headerStyle: const DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: Color(0xFF00787A),
                    fontFamily: 'Montserrat',
                  ))),
        )
      ],
    );

    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return dialog;
              });
          // setState(() {
          //   _isOpen = true;
          // });
        },
        child: const Text('set date'));
  }
}
