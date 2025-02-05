import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final List<String> history;

  const HistoryWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(history[index]),
          );
        },
      ),
    );
  }
}
