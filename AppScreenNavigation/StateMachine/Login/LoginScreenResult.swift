enum LoginScreenResult {
  case didTapLoginButton
}

extension LoginScreenResult: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .loginScreen(self)
  }
}
