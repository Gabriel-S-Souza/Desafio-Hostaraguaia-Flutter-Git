import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import 'profile_card_widget.dart';

class ItemPullRequestWidget extends StatelessWidget {
  const ItemPullRequestWidget({
    super.key,
    required this.pull,
  });
  final PullRequestEntity pull;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 28, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        pull.title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        pull.body ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          height: 1.24,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: ProfileCardWidget(
                  avatarUrl: pull.urlAvatar,
                  userName: pull.login,
                  fulName: pull.fullName ?? 'Completed Name',
                  isSmall: true,
                ),
              ),
            ],
          ),
        ),
      );
}
