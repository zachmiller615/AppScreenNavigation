enum SettingsScreenResult {
  case didTapBackButton
}

extension SettingsScreenResult: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .settingsScreen(self)
  }
}
