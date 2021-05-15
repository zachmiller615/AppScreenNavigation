typealias UIFlowStateMachine = StateMachine<UIFlowReducer>

struct UIFlowReducer: Reducer {
  static func transition(from currentState: UIFlowState, with event: UIFlowEvent) -> UIFlowState {
    let newState: UIFlowState
    switch (event, currentState.screen) {
    case (let .loginScreen(result), .login):
      newState = LoginScreenReducer.transition(from: result)
    case (let .scheduleScreen(result), .schedule):
      newState = ScheduleScreenReducer.transition(from: result)
    case (let .settingsScreen(result), .settings):
      newState = SettingsScreenReducer.transition(from: result)
    default:
      newState = currentState
    }
    print("Event: \(event)")
    print("Current State: \(currentState)")
    print("New State: \(newState)")
    return newState
  }
}
