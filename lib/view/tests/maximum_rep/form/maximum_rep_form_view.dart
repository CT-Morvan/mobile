import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/tests/maximum_rep/exercise_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/tests/maximum_rep/form/bloc/max_rep_form_bloc.dart';
import 'package:ct_morvan_app/widget/app_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "MaximumRepFormViewRoute")
class MaximumRepFormView extends StatefulWidget {
  const MaximumRepFormView({super.key});

  @override
  State<MaximumRepFormView> createState() => _MaximumRepFormViewState();
}

class _MaximumRepFormViewState extends State<MaximumRepFormView> {
  final MaxRepFormBloc _bloc = MaxRepFormBloc();

  List<ExerciseModel> items = [];

  @override
  void initState() {
    super.initState();
    _bloc.add(MaxRepGetFormEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(t.maximumRepTest, style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<MaxRepFormBloc, MaxRepFormState>(
        listener: (context, state) {
          if (state is MaxRepGetFormSuccessState && state.list.data != null) {
            setState(() {
              items = state.list.data!;
            });
          }
          if (state is MaxRepGetFormErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is MaxRepLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppTextFieldWidget(
                        label: 'Máximo de repetições',
                        onChanged: (value) {
                          setState(() {
                            item.maxRep = int.parse(value);
                          });
                        },
                        controller: TextEditingController(
                          text: item.maxRep == 0 ? "" : item.maxRep.toString(),
                        ),
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppTextFieldWidget(
                        label: 'Carga utilizada',
                        onChanged: (value) {
                          setState(() {
                            item.workload = double.parse(value);
                          });
                        },
                        controller: TextEditingController(
                          text:
                              item.workload == 0
                                  ? ""
                                  : item.workload.toString(),
                        ),
                        suffixText: "kg",
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
