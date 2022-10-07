import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import 'widgets.dart';

class ItemRepoWidget extends StatelessWidget {
  const ItemRepoWidget({super.key, required this.repo, this.onTap});
  final GithubRepoEntity repo;
  final void Function(GithubRepoEntity)? onTap;

  @override
  Widget build(BuildContext context) => Ink(
        height: 140,
        child: InkWell(
          onTap: () => onTap?.call(repo),
          highlightColor:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.35),
          splashColor:
              Theme.of(context).colorScheme.onSecondary.withOpacity(0.35),
          focusColor: Colors.transparent,
          child: SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: AutoSizeText(
                                  repo.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  repo.description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    height: 1.24,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.branch,
                                    width: 16,
                                  ),
                                  Text(
                                    repo.forksCount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  Image.asset(
                                    Assets.star,
                                    width: 16,
                                  ),
                                  Text(
                                    repo.stargazersCount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: ProfileCardWidget(
                        avatarUrl: repo.profile.avatarUrl,
                        userName: repo.profile.login,
                        fulName: repo.profile.name ?? 'Completed Name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ),
          ),
        ),
      );
}
