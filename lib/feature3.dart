import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Import the intl package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formatted Date Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DatePickerPage(),
    );
  }
}

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  // Variable to hold the selected date
  DateTime? _selectedDate;

  // Method to show the date picker and select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime firstDate = DateTime(currentDate.year - 10); // 10 years ago
    final DateTime lastDate = DateTime(currentDate.year + 10); // 10 years ahead

    // Show the date picker dialog
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? currentDate, // Use the selected date or current date as initial
      firstDate: firstDate,
      lastDate: lastDate,
    );

    // If the user picks a date, format and update the state
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format the selected date using intl package if a date is selected
    String formattedDate = _selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
        : 'No date selected';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formatted Date Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the formatted date
            Text(
              'Selected Date: $formattedDate',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Button to open the date picker
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
