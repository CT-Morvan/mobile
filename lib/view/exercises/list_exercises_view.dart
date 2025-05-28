import 'package:auto_route/auto_route.dart';
import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:ct_morvan_app/models/exercises/exercise_model.dart';
import 'package:ct_morvan_app/routes/ct_morvan_routes.gr.dart';
import 'package:ct_morvan_app/translations/strings.g.dart';
import 'package:ct_morvan_app/view/exercises/bloc/list_exercises_bloc.dart';
import 'package:ct_morvan_app/view/exercises/widget/exercise_list_item_widget.dart';
import 'package:ct_morvan_app/widget/fullscreen_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "ListExercisesViewRoute")
class ListExercisesView extends StatefulWidget {
  const ListExercisesView({super.key});

  @override
  State<ListExercisesView> createState() => _ListExercisesViewState();
}

class _ListExercisesViewState extends State<ListExercisesView> {
  final ListExercisesBloc _bloc = ListExercisesBloc();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    _bloc.add(ListExercisesGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ListExercisesBloc, ListExercisesState>(
        listener: (context, state) {
          if (state is DeleteExerciseStateError) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.deleteUserError)));
          }
          if (state is DeleteExerciseStateSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(t.deleteUserSuccess)));
            fetchData();
          }
        },
        bloc: _bloc,
        builder: (context, state) {
          if (state is ListExercisesStateSuccess) {
            if (state.list.isEmpty) {
              return FullscreenMessageWidget(
                title: t.usersListEmpty,
                buttonText: t.createUser,
                buttonAction: () {
                  AutoRouter.of(context).push(CreateUserViewRoute()).then((_) {
                    fetchData();
                  });
                },
              );
            }

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (buildContext, index) {
                ExerciseModel exercise = state.list[index];
                return ExerciseListItemWidget(
                  exerciseName: exercise.name ?? "",
                  onTap: () {},
                );
              },
              itemCount: state.list.length,
            );
          }

          if (state is ListExercisesStateError) {
            return FullscreenMessageWidget(
              title: t.genericError,
              buttonText: t.tryAgain,
              buttonAction: () {
                fetchData();
              },
              icon: Icon(
                Icons.warning_amber_outlined,
                size: 128,
                color: grayColor,
              ),
            );
          }

          return Center(child: CircularProgressIndicator(color: primaryColor));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(CreateUserViewRoute()).then((_) {
            fetchData();
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
