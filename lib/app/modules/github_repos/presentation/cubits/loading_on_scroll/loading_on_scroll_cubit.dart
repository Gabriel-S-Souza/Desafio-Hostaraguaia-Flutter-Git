import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_on_scroll.dart';

class LoadingOnScrollCubit extends Cubit<LoadingOnScrollState> {
  LoadingOnScrollCubit() : super(const LoadingOnScrollDisabled());

  void showLoading() async {
    emit(const LoadingOnScrollActive());
  }

  void removeLoading() async {
    emit(const LoadingOnScrollDisabled());
  }
}
