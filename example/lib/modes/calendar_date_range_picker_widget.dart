import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide CalendarDatePicker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

///
class CalendarDateRangePickerWidget extends StatefulWidget {
  @override
  _CalendarDateRangePickerWidgetState createState() => _CalendarDateRangePickerWidgetState();
}

class _CalendarDateRangePickerWidgetState extends State<CalendarDateRangePickerWidget> {
  ///
  final List<NepaliDateTime> dateRange = List.filled(2, NepaliDateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CalendarDateRangePicker(
              firstDate: NepaliDateTime(2070),
              lastDate: NepaliDateTime(2090),
              onStartDateChanged: (date) {
                dateRange.first = date;
                setState(() {});
              },
              onEndDateChanged: (date) {
                dateRange.last = date;
                setState(() {});
              },
            ),
          ),
          ListTile(
            title: Text('From: ${_format(dateRange.first)}'),
            subtitle: Text('To: ${_format(dateRange.last)}'),
            tileColor: Theme.of(context).primaryColor.withAlpha(50),
          ),
        ],
      ),
    );
  }

  String _format(NepaliDateTime dateTime) {
    if (dateTime == null) return '';
    return NepaliDateFormat.yMMMMEEEEd().format(dateTime);
  }
}
