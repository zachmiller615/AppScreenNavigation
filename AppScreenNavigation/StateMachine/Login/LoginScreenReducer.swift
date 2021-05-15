struct LoginScreenReducer {
  static func transition(from result: LoginScreenResult) -> UIFlowState {
    switch result {
    case .didTapLoginButton:
      return UIFlowState(screen: .schedule, segue: .setRoot)
    }
  }
}
