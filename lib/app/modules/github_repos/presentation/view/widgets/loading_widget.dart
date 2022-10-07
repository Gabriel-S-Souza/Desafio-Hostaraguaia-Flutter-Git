import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => Positioned(
        left: (MediaQuery.of(context).size.width / 2) - 20,
        bottom: 24,
        child: SizedBox(
          height: 40,
          width: 40,
          child: PhysicalModel(
            elevation: 8,
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.35),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );
}
