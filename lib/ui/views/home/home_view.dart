import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator.adaptive())
          : RiveWidgetBuilder(
              fileLoader: viewModel.fileLoader,
              builder: (context, state) => switch (state) {
                RiveLoading() =>
                  const Center(child: CircularProgressIndicator()),
                RiveFailed() => ErrorWidget.withDetails(
                    message: state.error.toString(),
                    error: FlutterError(state.error.toString()),
                  ),
                RiveLoaded() => RiveWidget(
                    controller: state.controller,
                    fit: Fit.cover,
                  )
              },
            ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.initRiveControllerWithTestArt();
  }
}
