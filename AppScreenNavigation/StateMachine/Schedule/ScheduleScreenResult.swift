enum ScheduleScreenResult {
  case didTapButton1
  case didTapButton2
}

extension ScheduleScreenResult: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .scheduleScreen(self)
  }
}
