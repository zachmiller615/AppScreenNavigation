struct SettingsScreenReducer {
  static func transition(from result: SettingsScreen.Result) -> [UIFlowCommand] {
    switch result {
    case .didTapBackButton:
      return [.dismiss]
    }
  }
}
