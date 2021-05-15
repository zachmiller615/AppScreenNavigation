import RxSwift

class ScheduleCoordinator {
   // MARK: - Properties
  private let dependencyManager: ScheduleDependencyManager
  private let router: WindowRouter

  private lazy var scheduleViewController = dependencyManager.createScheduleViewController()

  private var settingsCoordinator: SettingsCoordinator?

  // MARK: - Initializer
  init(dependencyManager: ScheduleDependencyManager, router: WindowRouter) {
    self.dependencyManager = dependencyManager
    self.router = router
  }

  // MARK: - Methods
  func start() -> Observable<Void> {
    router.setRoot(scheduleViewController)
    return handleEvents(from: scheduleViewController)
  }
}

// MARK: - Private Methods
extension ScheduleCoordinator {
  private func handleEvents(from scheduleViewController: ScheduleViewController) -> Observable<Void> {
    let didTapButton1 = scheduleViewController.didTapButton1.mapTo(1)
    let didTapButton2 = scheduleViewController.didTapButton2.mapTo(2)
    return Observable
      .merge(didTapButton1, didTapButton2)
      .map(SettingsModel.init)
      .withUnretained(self)
      .flatMapLatest { strongSelf, settingsModel in
        strongSelf.navigateToSettings(with: settingsModel)
      }
  }

  private func navigateToSettings(with settingsModel: SettingsModel) -> Observable<Void> {
    let settingsRouter = Router(previousViewController: scheduleViewController)
    let settingsCoordinator = dependencyManager.createSettingsCoordinator(with: settingsModel, and: settingsRouter)
    self.settingsCoordinator = settingsCoordinator
    return settingsCoordinator.start().do(onNext: { [weak self] _ in
      self?.settingsCoordinator = nil
    })
  }
}
