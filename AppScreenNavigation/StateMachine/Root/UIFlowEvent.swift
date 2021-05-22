enum UIFlowEvent {
  case backgroundEvent(BackgroundEvent)
  case loginScreen(LoginScreen.Result)
  case scheduleScreen(ScheduleScreen.Result)
  case settingsScreen(SettingsScreen.Result)
}
