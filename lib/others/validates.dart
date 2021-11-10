//retorna null em caso de sucesso.
String? validadeInput(
    String valueInput, int minCharactersValidate, String errorMsg) {
  if (valueInput.length < minCharactersValidate || valueInput.length >= 30) {
    return errorMsg;
  }
  return null;
}
