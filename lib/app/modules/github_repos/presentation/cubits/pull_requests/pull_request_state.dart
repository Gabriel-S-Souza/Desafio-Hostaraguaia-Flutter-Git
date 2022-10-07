import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

abstract class PullRequestState extends Equatable {
  final List<PullRequestEntity> pullsOpened;
  final List<PullRequestEntity> pullsClosed;
  final PullRequestType pullType;

  const PullRequestState({
    this.pullsOpened = const [],
    this.pullsClosed = const [],
    required this.pullType,
  });
}

class PullRequestLoading extends PullRequestState {
  final PullRequestType type;

  const PullRequestLoading({required this.type}) : super(pullType: type);

  @override
  List<Object?> get props => [type];
}

class PullRequestCompleted extends PullRequestState {
  final List<PullRequestEntity> opened;
  final List<PullRequestEntity> closed;
  final PullRequestType type;

  const PullRequestCompleted({
    required this.type,
    required this.opened,
    required this.closed,
  }) : super(
          pullType: type,
          pullsOpened: opened,
          pullsClosed: closed,
        );

  @override
  List<Object?> get props => [pullsOpened, pullsClosed, pullType];
}

class PullRequestError extends PullRequestState {
  final PullRequestType type;
  final String errorMessage;

  const PullRequestError({required this.type, required this.errorMessage})
      : super(pullType: type);

  @override
  List<Object?> get props => [errorMessage, pullType];
}

enum PullRequestType {
  opened('open'),
  closed('closed');

  const PullRequestType(this.status);

  final String status;
}
