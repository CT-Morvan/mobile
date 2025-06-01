import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/tests/bioimpedance/bioimpedance_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/tests/bioimpedance/form/bloc/bioimpedance_form_bloc.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage(name: "BioimpedanceFormViewRoute")
class BioimpedanceFormView extends StatefulWidget {
  final int? userId;
  const BioimpedanceFormView({required this.userId, super.key});

  @override
  State<BioimpedanceFormView> createState() => _BioimpedanceFormViewState();
}

class _BioimpedanceFormViewState extends State<BioimpedanceFormView> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final imcController = TextEditingController();
  final fatPercentageController = TextEditingController();
  final musclePercentageController = TextEditingController();
  final basalMetabolismController = TextEditingController();
  final metabolicAgeController = TextEditingController();
  final visceralFatController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final BioimpedanceFormBloc _bloc = BioimpedanceFormBloc();
  DateTime selectedDate = DateTime.now();

  bool isLoading = false;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    imcController.dispose();
    fatPercentageController.dispose();
    musclePercentageController.dispose();
    basalMetabolismController.dispose();
    metabolicAgeController.dispose();
    visceralFatController.dispose();
    super.dispose();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return t.requiredField;
    }
    if (double.parse(value) < 1) {
      return t.minimumValue(value: 0);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.maximumRepTest)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isLoading ? grayColor.withAlpha(90) : primaryColor,
        onPressed:
            isLoading
                ? null
                : () {
                  if (_formKey.currentState!.validate()) {
                    final bioimpedance = BioimpedanceModel(
                      date: selectedDate,
                      height: double.tryParse(heightController.text),
                      weight: double.tryParse(weightController.text),
                      imc: double.tryParse(imcController.text),
                      fatPercentage: double.tryParse(
                        fatPercentageController.text,
                      ),
                      musclePercentage: double.tryParse(
                        musclePercentageController.text,
                      ),
                      basalMetabolism: double.tryParse(
                        basalMetabolismController.text,
                      ),
                      metabolicAge: double.tryParse(
                        metabolicAgeController.text,
                      ),
                      visceralFat: double.tryParse(visceralFatController.text),
                    );

                    setState(() {
                      isLoading = true;
                    });
                    _bloc.add(
                      BioimpedanceFormEvent(
                        userId: widget.userId,
                        bioimpedance: bioimpedance,
                      ),
                    );
                  }
                },
        child: Icon(Icons.check, color: whiteColor),
      ),
      body: BlocConsumer<BioimpedanceFormBloc, BioimpedanceFormState>(
        listener: (context, state) {
          if (state is BioimpedanceFormStateSuccess) {
            AutoRouter.of(context).pop();
          }

          if (state is BioimpedanceFormStateError) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is BioimpedanceFormStateLoading) {
            setState(() {
              isLoading = true;
            });
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is BioimpedanceFormStateLoading) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat(
                              'dd/MM/yyyy',
                            ).format(selectedDate).split(' ')[0],
                          ),
                        ),
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: Text(
                            t.changeDate,
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    AppTextFieldWidget(
                      label: t.height,
                      controller: heightController,
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                      validator: validator,
                      suffixText: t.cm,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppTextFieldWidget(
                        label: t.weight,
                        controller: weightController,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        validator: validator,
                        suffixText: t.kg,
                      ),
                    ),
                    AppTextFieldWidget(
                      label: t.imc,
                      controller: imcController,
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                      validator: validator,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppTextFieldWidget(
                        label: t.fatPercentage,
                        controller: fatPercentageController,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        validator: validator,
                        suffixText: t.percentageSymbol,
                      ),
                    ),
                    AppTextFieldWidget(
                      label: t.musclePercentage,
                      controller: musclePercentageController,
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                      validator: validator,
                      suffixText: t.percentageSymbol,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppTextFieldWidget(
                        label: t.basalMetabolism,
                        controller: basalMetabolismController,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        validator: validator,
                      ),
                    ),
                    AppTextFieldWidget(
                      label: t.metabolicAge,
                      controller: metabolicAgeController,
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                      validator: validator,
                      suffixText: t.years,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppTextFieldWidget(
                        label: t.visceralFat,
                        controller: visceralFatController,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        validator: validator,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
