enum UIFlowCommand {
  case setRoot(UIFlowScreen)
  case present(UIFlowScreen)
  case push(UIFlowScreen)
  case dismiss
  case pop
  case popToRoot
}
