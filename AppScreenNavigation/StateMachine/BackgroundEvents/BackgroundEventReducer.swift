struct BackgroundEventReducer {
  static func transition(from backgroundEvent: BackgroundEvent) -> [UIFlowCommand] {
    switch backgroundEvent {
    case .didReceiveDeepLink:
      let settingsModel = SettingsModel(chosenNumber: 3)
      let settingsScreen = SettingsScreen(model: settingsModel)
      return [.popToRoot, .present(settingsScreen)]
    }
  }
}