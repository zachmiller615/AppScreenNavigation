struct UIFlowReducer {
  static func transition(from currentScreen: UIFlowScreen, with event: UIFlowEvent) -> [UIFlowCommand] {
    let commands: [UIFlowCommand]
    switch (event, currentScreen.identifier) {
    case (let .backgroundEvent(backgroundEvent), _):
      commands = BackgroundEventReducer.transition(from: backgroundEvent)
    case (let .loginScreen(result), .login):
      commands = LoginScreenReducer.transition(from : result)
    case (let .scheduleScreen(result), .schedule):
      commands = ScheduleScreenReducer.transition(from : result)
    case (let .settingsScreen(result), .settings):
      commands = SettingsScreenReducer.transition(from : result)
    default:
      print("Unexpected code path")
      commands = []
    }
    print("Event: \(event)")
    print("Current Screen: \(currentScreen)")
    print("Commands: \(commands)")
    print("\n")
    return commands
  }
}

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
