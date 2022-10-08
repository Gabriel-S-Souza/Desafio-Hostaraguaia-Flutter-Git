import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

abstract class PullRequestState extends Equatable {
  final List<PullRequestEntity> pullsOpened;
  final List<PullRequestEntity> pullsClosed;
  final PullRequestType pullSelectedType;

  const PullRequestState({
    this.pullsOpened = const [],
    this.pullsClosed = const [],
    required this.pullSelectedType,
  });
}

class PullRequestLoading extends PullRequestState {
  final PullRequestType type;

  const PullRequestLoading({required this.type})
      : super(pullSelectedType: type);

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
          pullSelectedType: type,
          pullsOpened: opened,
          pullsClosed: closed,
        );

  @override
  List<Object?> get props => [pullsOpened, pullsClosed, pullSelectedType];
}

class PullRequestError extends PullRequestState {
  final PullRequestType type;
  final String errorMessage;

  const PullRequestError({required this.type, required this.errorMessage})
      : super(pullSelectedType: type);

  @override
  List<Object?> get props => [errorMessage, pullSelectedType];
}

enum PullRequestType {
  opened('open'),
  closed('closed');

  const PullRequestType(this.status);

  final String status;
}
