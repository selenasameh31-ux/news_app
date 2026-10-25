import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.error, required this.onRefresh});

  final String error;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.h,
          children: [
            Text(error),
            FilledButton.icon(
              onPressed: onRefresh,
              label: Text('Reload'),
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
