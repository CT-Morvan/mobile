import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicFormData extends ChangeNotifier {
  List<FormFieldData> fields = [
    FormFieldData(label: 'Name', type: FormFieldType.text),
    FormFieldData(label: 'Email', type: FormFieldType.email),
    FormFieldData(label: 'Age', type: FormFieldType.number),
  ];

  Map<String, dynamic> formData = {};

  void addField() {
    fields.add(FormFieldData(label: 'New Field', type: FormFieldType.text));
    notifyListeners();
  }

  void removeField(int index) {
    fields.removeAt(index);
    formData.remove(fields[index].label);
    notifyListeners();
  }

  void updateFieldValue(String fieldLabel, dynamic value) {
    formData[fieldLabel] = value;
    notifyListeners();
  }

  void updateFieldLabel(int index, String newLabel) {
    fields[index] = fields[index].copyWith(label: newLabel);
    if (formData.containsKey(fields[index].label)) {
      formData[newLabel] = formData.remove(fields[index].label);
    }
    notifyListeners();
  }

  void updateFieldType(int index, FormFieldType newType) {
    fields[index] = fields[index].copyWith(type: newType);
    notifyListeners();
  }
}

enum FormFieldType { text, email, number, dropdown }

class FormFieldData {
  final String label;
  final FormFieldType type;
  final List<String>? dropdownOptions;

  FormFieldData({
    required this.label,
    required this.type,
    this.dropdownOptions,
  });

  FormFieldData copyWith({
    String? label,
    FormFieldType? type,
    List<String>? dropdownOptions,
  }) {
    return FormFieldData(
      label: label ?? this.label,
      type: type ?? this.type,
      dropdownOptions: dropdownOptions ?? this.dropdownOptions,
    );
  }
}

@RoutePage(name: "MaximumRepFormViewRoute")
class MaximumRepFormView extends StatelessWidget {
  const MaximumRepFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Form')),
      body: Consumer<DynamicFormData>(
        builder: (context, formData, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: formData.fields.length + 1,
              itemBuilder: (context, index) {
                if (index < formData.fields.length) {
                  final field = formData.fields[index];
                  return DynamicFormField(
                    field: field,
                    onChanged: (value) {
                      formData.updateFieldValue(field.label, value);
                    },
                    onLabelChanged: (newLabel) {
                      formData.updateFieldLabel(index, newLabel);
                    },
                    onTypeChanged: (newType) {
                      formData.updateFieldType(index, newType);
                    },
                    onRemove: () {
                      formData.removeField(index);
                    },
                    initialValue: formData.formData[field.label],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        formData.addField();
                      },
                      child: const Text('Add Field'),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class DynamicFormField extends StatefulWidget {
  final FormFieldData field;
  final Function(dynamic) onChanged;
  final Function(String) onLabelChanged;
  final Function(FormFieldType) onTypeChanged;
  final VoidCallback onRemove;
  final dynamic initialValue;

  const DynamicFormField({
    super.key,
    required this.field,
    required this.onChanged,
    required this.onLabelChanged,
    required this.onTypeChanged,
    required this.onRemove,
    this.initialValue,
  });

  @override
  State<DynamicFormField> createState() => _DynamicFormFieldState();
}

class _DynamicFormFieldState extends State<DynamicFormField> {
  late TextEditingController _labelController;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: widget.field.label);
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget formField;

    switch (widget.field.type) {
      case FormFieldType.text:
        formField = TextFormField(
          initialValue: widget.initialValue?.toString() ?? '',
          decoration: InputDecoration(labelText: widget.field.label),
          onChanged: widget.onChanged,
        );
        break;
      case FormFieldType.email:
        formField = TextFormField(
          initialValue: widget.initialValue?.toString() ?? '',
          decoration: InputDecoration(labelText: widget.field.label),
          keyboardType: TextInputType.emailAddress,
          onChanged: widget.onChanged,
        );
        break;
      case FormFieldType.number:
        formField = TextFormField(
          initialValue: widget.initialValue?.toString() ?? '',
          decoration: InputDecoration(labelText: widget.field.label),
          keyboardType: TextInputType.number,
          onChanged: widget.onChanged,
        );
        break;
      case FormFieldType.dropdown:
        formField = DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: widget.field.label),
          value: widget.initialValue,
          items:
              widget.field.dropdownOptions?.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
          onChanged: (value) {
            widget.onChanged(value);
          },
        );
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _labelController,
                    decoration: const InputDecoration(labelText: 'Field Label'),
                    onChanged: widget.onLabelChanged,
                  ),
                ),
                PopupMenuButton<FormFieldType>(
                  initialValue: widget.field.type,
                  onSelected: (FormFieldType newType) {
                    widget.onTypeChanged(newType);
                  },
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<FormFieldType>>[
                        const PopupMenuItem<FormFieldType>(
                          value: FormFieldType.text,
                          child: Text('Text'),
                        ),
                        const PopupMenuItem<FormFieldType>(
                          value: FormFieldType.email,
                          child: Text('Email'),
                        ),
                        const PopupMenuItem<FormFieldType>(
                          value: FormFieldType.number,
                          child: Text('Number'),
                        ),
                        const PopupMenuItem<FormFieldType>(
                          value: FormFieldType.dropdown,
                          child: Text('Dropdown'),
                        ),
                      ],
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: widget.onRemove,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            formField,
          ],
        ),
      ),
    );
  }
}
