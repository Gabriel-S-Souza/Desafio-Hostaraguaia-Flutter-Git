import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.fulName,
    this.isSmall = false,
  });
  final String avatarUrl;
  final String userName;
  final String fulName;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    if (isSmall) {
      return _buildSmallCard(context);
    }

    return Column(
      children: [
        ClipOval(
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            child: CachedNetworkImage(
              imageUrl: avatarUrl,
              placeholder: (context, url) => Image.asset(
                Assets.person,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Flexible(
          child: AutoSizeText(
            userName,
            maxFontSize: 14,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary.withAlpha(215),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          child: AutoSizeText(
            userName,
            maxFontSize: 12,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallCard(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                placeholder: (context, url) => Image.asset(
                  Assets.person,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  userName,
                  maxFontSize: 12,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary.withAlpha(215),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: AutoSizeText(
                  fulName,
                  maxFontSize: 10,
                  minFontSize: 8,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ],
      );
}
