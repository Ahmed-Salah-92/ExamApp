class BaseUIState<T> {
  bool? isLoading;
  String? errorMessage;
  T? data;

  BaseUIState({this.isLoading = false, this.errorMessage, this.data});
}