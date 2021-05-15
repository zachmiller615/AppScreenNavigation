class SettingsDependencyManager {
  // MARK: - Properties
  private let model: SettingsModel

  // MARK: - Initializer
  init(model: SettingsModel) {
    self.model = model
  }

  // MARK: - Methods
  func createSettingsCoordinator(with router: Router) -> SettingsCoordinator {
    SettingsCoordinator(dependencyManager: self, router: router)
  }

  func createSettingsViewController() -> SettingsViewController {
    SettingsViewController(viewModel: createSettingsViewModel())
  }
}

// MARK: - Private Methods
extension SettingsDependencyManager {
  private func createSettingsViewModel() -> SettingsViewModel {
    SettingsViewModel(model: model)
  }
}
