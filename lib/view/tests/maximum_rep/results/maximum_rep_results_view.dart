import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/user_model.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/tests/maximum_rep/results/bloc/max_rep_result_bloc.dart';
import 'package:ct_morvan_app/view/tests/maximum_rep/widget/maximum_rep_chart_widget.dart';
import 'package:ct_morvan_app/widget/fullscreen_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "MaximumRepResultsViewRoute")
class MaximumRepResultsView extends StatefulWidget {
  final UserModel user;
  const MaximumRepResultsView({required this.user, super.key});

  @override
  State<MaximumRepResultsView> createState() => _MaximumRepResultsViewState();
}

class _MaximumRepResultsViewState extends State<MaximumRepResultsView> {
  final _bloc = MaxRepResultBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${t.maximumRepTest} - ${widget.user.name}")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: BlocConsumer<MaxRepResultBloc, MaxRepResultState>(
          listener: (context, state) {
            if (state is MaxRepResultStateError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          bloc: _bloc,
          builder: (context, state) {
            if (state is MaxRepResultStateSuccess) {
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
                child: ListView.separated(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return MaximumRepChartWidget(
                      title: state.list[index].name ?? "",
                      series: state.list[index].maximums ?? [],
                    );
                  },
                  itemCount: state.list.length,
                  shrinkWrap: true,
                ),
              );
            }

            if (state is MaxRepResultStateError) {
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

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    _bloc.add(MaxRepResultEvent(userId: widget.user.id));
  }
}
