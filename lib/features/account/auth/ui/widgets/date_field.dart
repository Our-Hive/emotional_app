import 'package:flutter/material.dart';

import 'package:emotional_app/shared/utils/date_time_formatter.dart';

class DateField extends StatefulWidget {
  const DateField({
    super.key,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FilledButton.tonalIcon(
        onPressed: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            setState(() {
              _selectedDate = selectedDate;
            });
          }
        },
        icon: const Icon(Icons.calendar_today),
        label: Text(
          _selectedDate == null
              ? 'Selecciona tu fecha de nacimiento'
              : 'Fecha de nacimiento: ${DateTimeFormatter.getFormattedDate(_selectedDate!)}',
        ),
      ),
    );
  }
}
