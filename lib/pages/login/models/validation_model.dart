class ValidationModel<T> {
  ValidationModel(this.value, this.error);
  T? value;
  String? error;
}
