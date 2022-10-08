import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../cubits.dart';

class PullRequestCubit extends Cubit<PullRequestState> {
  final PullRequestCase _pullRequestCase;
  PullRequestCubit(this._pullRequestCase)
      : super(
          const PullRequestLoading(
            type: PullRequestType.opened,
          ),
        );

  late GithubRepoEntity? repo;
  PullRequestType pullRequestSelectedType = PullRequestType.opened;

  List<PullRequestEntity> _openedPulls = [];
  List<PullRequestEntity> _closedPulls = [];

  Future<void> getPullRequests() async {
    emit(
      PullRequestLoading(type: pullRequestSelectedType),
    );
    final response = await _pullRequestCase.getPullRequests(
      repo!.login,
      repo!.name,
    );

    response.fold(
      (exception) => log(exception.message.toString()),
      (pullsList) {
        _openedPulls = pullsList
            .where(
              (element) => element.state == PullRequestType.opened.status,
            )
            .toList();
        _closedPulls = pullsList
            .where(
              (element) => element.state == PullRequestType.closed.status,
            )
            .toList();

        return emit(
          PullRequestCompleted(
            opened: _openedPulls,
            closed: _closedPulls,
            type: pullRequestSelectedType,
          ),
        );
      },
    );
  }

  void setPullRequestType(PullRequestType type) {
    if (type == pullRequestSelectedType) return;

    pullRequestSelectedType = type;
    emit(
      PullRequestCompleted(
        opened: _openedPulls,
        closed: _closedPulls,
        type: pullRequestSelectedType,
      ),
    );
  }
}
