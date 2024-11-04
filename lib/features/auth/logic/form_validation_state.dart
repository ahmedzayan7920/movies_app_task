sealed class FormValidationState {
  const FormValidationState();
}

class FormInitialState extends FormValidationState {
  const FormInitialState();
}

class FormValidState extends FormValidationState {
  const FormValidState();
}

class FormInvalidState extends FormValidationState {
  final Map<String, String> errors;
  const FormInvalidState(this.errors);
}