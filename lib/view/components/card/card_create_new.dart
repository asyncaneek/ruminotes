import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumi_notes/view/components/defines.dart';

class CardCreateNewHeader extends StatelessWidget {
  const CardCreateNewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarPrefferedSize + 4,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          const SizedBox(height: defaultPadding / 2),
          Container(
            width: 300,
            height: 4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultCornerRadius),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Row(
            children: const [
              Spacer(),
              Text(
                "N E W  N O T E",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: defaultPadding),
              Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}

// Create a Form widget.
class CardCreateNewForm extends StatefulWidget {
  const CardCreateNewForm({Key? key}) : super(key: key);

  @override
  CardCreateNewFormState createState() {
    return CardCreateNewFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CardCreateNewFormState extends State<CardCreateNewForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: defMaxWidth),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _spacer(),
                _title(),
                _spacer(),
                _description(),
                _spacer(),
                _datetime(),
                _spacer(),
                _confirm(context),
                _spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _confirm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _clear(context),
        _spacer(),
        _save(context),
      ],
    );
  }

  DateTimeFormField _datetime() {
    return DateTimeFormField(
      dateFormat: DateFormat('E, MMM dd • hh:mm aaa'),
      initialValue: DateTime.now(),
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note),
      ),
      mode: DateTimeFieldPickerMode.dateAndTime,
      autovalidateMode: AutovalidateMode.always,
      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      onDateSelected: (DateTime value) {
        print(value);
      },
    );
  }

  Widget _description() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'D E S C R I P T I O N',
      ),
    );
  }

  TextFormField _title() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'T I T L E',
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _save(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('S A V E'),
    );
  }

  Widget _clear(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('C L E A R'),
    );
  }
}

Widget _spacer() =>
    const SizedBox(width: defaultPadding, height: defaultPadding);
