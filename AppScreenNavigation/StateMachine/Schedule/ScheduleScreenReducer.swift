struct ScheduleScreenReducer {
  static func transition(from result: ScheduleScreen.Result) -> [UIFlowCommand] {
    switch result {
    case .didTapButton1:
      let settingsModel = SettingsModel(chosenNumber: 1)
      let settingsScreen = SettingsScreen(model: settingsModel)
      return [.present(settingsScreen)]
    case .didTapButton2:
      let settingsModel = SettingsModel(chosenNumber: 2)
      let settingsScreen = SettingsScreen(model: settingsModel)
      return [.present(settingsScreen)]
    }
  }
}
