
sealed class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {
  final int pageIndex;
  OnBoardingPageChanged(this.pageIndex);
}
