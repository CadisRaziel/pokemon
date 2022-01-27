class FailureApi implements Exception {
  //aqui vamos tratar o erro do try catch do repository
  final String? message;

  FailureApi({this.message});
}
