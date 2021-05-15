import RxSwift

class SettingsCoordinator {
   // MARK: - Properties
  private let dependencyManager: SettingsDependencyManager
  private let router: Router

  // MARK: - Initializer
  init(dependencyManager: SettingsDependencyManager, router: Router) {
    self.dependencyManager = dependencyManager
    self.router = router
  }

  // MARK: - Methods
  func start() -> Observable<Void> {
    let settingsViewController = dependencyManager.createSettingsViewController()
    router.present(settingsViewController)
    return navigateBack(from: settingsViewController)
  }
}

// MARK: - Private Methods
extension SettingsCoordinator {
  private func navigateBack(from settingsViewController: SettingsViewController) -> Observable<Void> {
    settingsViewController.didTapBackButton.do(onNext: { [weak self] _ in
      self?.router.dismiss()
    })
  }
}
