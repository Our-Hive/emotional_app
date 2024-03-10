import 'package:emotional_app/features/account/auth/ui/provider/signup_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:emotional_app/shared/domain/utils/date_time_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateField extends ConsumerStatefulWidget {
  const DateField({
    super.key,
  });

  @override
  DateFieldState createState() => DateFieldState();
}

class DateFieldState extends ConsumerState<DateField> {
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
            ref
                .watch(signUpFormProvider.notifier)
                .onBirthDateChanged(selectedDate);
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
