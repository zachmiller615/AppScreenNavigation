class ScheduleDependencyManager {
  func createScheduleCoordinator(with router: WindowRouter) -> ScheduleCoordinator {
    ScheduleCoordinator(dependencyManager: self, router: router)
  }

  func createScheduleViewController() -> ScheduleViewController {
    ScheduleViewController()
  }

  func createSettingsCoordinator(with model: SettingsModel, and router: Router) -> SettingsCoordinator {
    SettingsDependencyManager(model: model).createSettingsCoordinator(with: router)
  }
}
