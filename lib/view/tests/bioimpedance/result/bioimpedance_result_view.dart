import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/tests/bioimpedance/result/bloc/bioimpedance_result_bloc.dart';
import 'package:ct_morvan_app/view/tests/bioimpedance/result/widget/bioimpedance_percentage_graphic_widget.dart';
import 'package:ct_morvan_app/widget/fullscreen_message_widget.dart';
import 'package:ct_morvan_app/widget/generic_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "BioimpedanceResultViewRoute")
class BioimpedanceResultView extends StatefulWidget {
  final UserModel user;
  const BioimpedanceResultView({required this.user, super.key});

  @override
  _BioimpedanceResultViewState createState() => _BioimpedanceResultViewState();
}

class _BioimpedanceResultViewState extends State<BioimpedanceResultView> {
  final _bloc = BioimpedanceResultBloc();

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    _bloc.add(BioimpedanceResultEvent(userId: widget.user.id));
  }

  List<GenericChartModel> createSerie(Map<DateTime, double> series) {
    final List<GenericChartModel> newSerie = [];

    for (final serie in series.entries) {
      newSerie.add(GenericChartModel(date: serie.key, value: serie.value));
    }

    return newSerie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${t.bioimpedance} - ${widget.user.name}")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: BlocConsumer<BioimpedanceResultBloc, BioimpedanceResultState>(
          listener: (context, state) {
            if (state is BioimpedanceResultStateError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          bloc: _bloc,
          builder: (context, state) {
            if (state is BioimpedanceResultStateSuccess) {
              if (state.list.isEmpty) {
                return FullscreenMessageWidget(
                  title: t.usersListEmpty,
                  buttonText: t.createUser,
                  buttonAction: () {
                    _fetchData();
                  },
                );
              }
              return RefreshIndicator(
                color: primaryColor,
                onRefresh: _fetchData,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    children: [
                      BioimpedancePercentageGraphicWidget(list: state.list),
                      GenericChartWidget(
                        title: t.weight,
                        label: t.weight,
                        unit: t.kg,
                        series: createSerie(
                          Map.fromEntries(
                            state.list.map(
                              (value) => MapEntry(value.date!, value.weight!),
                            ),
                          ),
                        ),
                      ),
                      GenericChartWidget(
                        title: t.basalMetabolism,
                        label: t.basalMetabolism,
                        series: createSerie(
                          Map.fromEntries(
                            state.list.map(
                              (value) =>
                                  MapEntry(value.date!, value.basalMetabolism!),
                            ),
                          ),
                        ),
                      ),
                      GenericChartWidget(
                        title: t.metabolicAge,
                        label: t.metabolicAge,
                        unit: t.years,
                        series: createSerie(
                          Map.fromEntries(
                            state.list.map(
                              (value) =>
                                  MapEntry(value.date!, value.metabolicAge!),
                            ),
                          ),
                        ),
                      ),
                      GenericChartWidget(
                        title: t.visceralFat,
                        label: t.visceralFat,
                        series: createSerie(
                          Map.fromEntries(
                            state.list.map(
                              (value) =>
                                  MapEntry(value.date!, value.visceralFat!),
                            ),
                          ),
                        ),
                      ),
                      GenericChartWidget(
                        title: t.imc,
                        label: t.imc,
                        series: createSerie(
                          Map.fromEntries(
                            state.list.map(
                              (value) => MapEntry(value.date!, value.imc!),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is BioimpedanceResultStateError) {
              return FullscreenMessageWidget(
                title: t.genericError,
                buttonText: t.tryAgain,
                buttonAction: () {
                  _fetchData();
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          },
        ),
      ),
    );
  }
}
