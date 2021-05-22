struct SettingsScreenDependencyManager {
  func createSettingsViewController(with model: SettingsModel) -> SettingsViewController2 {
    let viewModel = createSettingsViewModel(with: model)
    return SettingsViewController2(viewModel: viewModel)
  }
}

// MARK: - Private Methods
extension SettingsScreenDependencyManager {
  private func createSettingsViewModel(with model: SettingsModel) -> SettingsViewModel {
    SettingsViewModel(model: model)
  }
}