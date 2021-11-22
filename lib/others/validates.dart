//retorna null em caso de sucesso.
String? validadeInput(
    String valueInput, int minCharactersValidate, String errorMsg) {
  if (valueInput.length < minCharactersValidate || valueInput.length >= 30) {
    return errorMsg;
  }
  return null;
}

String? validadeLength(String valueInput, String? errorMsg) {
  if (valueInput.length < 4) {
    return errorMsg;
  }
  return null;
}
