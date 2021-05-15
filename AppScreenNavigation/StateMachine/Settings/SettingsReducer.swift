struct SettingsScreenReducer {
  static func transition(from result: SettingsScreenResult) -> UIFlowState {
    switch result {
    case .didTapBackButton:
      return UIFlowState(screen: .schedule, segue: .dismiss)
    }
  }
}
