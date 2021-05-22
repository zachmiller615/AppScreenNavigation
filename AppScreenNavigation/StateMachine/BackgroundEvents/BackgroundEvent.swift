enum BackgroundEvent {
  case didReceiveDeepLink
}

extension BackgroundEvent: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .backgroundEvent(self)
  }
}