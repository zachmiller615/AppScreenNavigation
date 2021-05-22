struct LoginScreenReducer {
  static func transition(from result: LoginScreen.Result) -> [UIFlowCommand] {
    switch result {
    case .didTapLoginButton:
      let scheduleScreen = ScheduleScreen()
      return [.setRoot(scheduleScreen)]
    }
  }
}
