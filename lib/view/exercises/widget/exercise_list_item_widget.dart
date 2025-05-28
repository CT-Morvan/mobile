import 'package:ct_morvan_app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class ExerciseListItemWidget extends StatelessWidget {
  final String exerciseName;
  final void Function() onTap;
  const ExerciseListItemWidget({
    required this.exerciseName,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  exerciseName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
              ),
            ),
            IconButton(onPressed: onTap, icon: Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
