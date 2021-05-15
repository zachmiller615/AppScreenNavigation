struct ScheduleScreenReducer {
  static func transition(from result: ScheduleScreenResult) -> UIFlowState {
    switch result {
    case .didTapButton1:
      let model = SettingsModel(chosenNumber: 1)
      return UIFlowState(screen: .settings(model), segue: .present)
    case .didTapButton2:
      let model = SettingsModel(chosenNumber: 2)
      return UIFlowState(screen: .settings(model), segue: .present)
    }
  }
}
