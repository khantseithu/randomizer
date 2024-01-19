import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key});

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // Validation passed, save the values and navigate
      _formKey.currentState?.save();
      // TODO: Navigate to generate number page or perform any other action
      print('Min: $_min, Max: $_max');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Select Range",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: "Minimum Value",
                onSave: (value) => _min = value,
              ),
              const SizedBox(
                height: 12,
              ),
              RangeSelectorTextFormField(
                labelText: "Maximum Number",
                onSave: (value) => _max = value,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          _submitForm();
          // TODO: Navigate to generate number page
        },
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.onSave,
  });

  final String labelText;
  final void Function(int value) onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Value must be integer";
        } else {
          return null;
        }
      },
      onSaved: (newValue) => onSave(int.parse(newValue ?? "")),
    );
  }
}
