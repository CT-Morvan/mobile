import 'package:flutter/material.dart';

class TestsView extends StatefulWidget {
  const TestsView({super.key});
  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends State<TestsView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("TestsView"));
  }
}
