import RxSwift

class UIFlowDirector {
  // MARK: - Properties
  private let dependencyManager: UIFlowDependencyManager
  private let router: UIFlowRouter
  private let stateMachine: UIFlowStateMachine
  private let screenDidFinish = PublishSubject<UIFlowEvent>()
  private let disposeBag = DisposeBag()

  // MARK: - Initializer
  init(dependencyManager: UIFlowDependencyManager, router: UIFlowRouter) {
    self.dependencyManager = dependencyManager
    self.router = router
    stateMachine = dependencyManager.createUIFlowStateMachine(with: screenDidFinish)
  }

  // MARK: - Methods
  func start() {
    bindStateMachine()
  }
}

// MARK: - Private Methods
extension UIFlowDirector {
  private func bindStateMachine() {
    stateMachine.state.subscribe(onNext: { [weak self] state in
      self?.respond(to: state)
    }).disposed(by: disposeBag)
  }

  private func respond(to state: UIFlowState) {
    switch state.screen {
    case .login:
      let loginViewController = dependencyManager.createLoginViewController()
      navigate(to: loginViewController, with: state.segue)
    case .schedule:
      let scheduleViewController = dependencyManager.createScheduleViewController()
      navigate(to: scheduleViewController, with: state.segue)
    case let .settings(model):
      let settingsViewController = dependencyManager.createSettingsViewController(with: model)
      navigate(to: settingsViewController, with: state.segue)
    }
  }

  private func navigate<Screen: UIFlowScreenFinishable & UIViewController>(to screen: Screen, with segue: UIFlowSegue) {
    router.navigate(to: screen, with: segue)
    guard segue != .dismiss else { return }
    screen.didFinish.toEvent.subscribe(onNext: { [weak self] result in
      self?.screenDidFinish.onNext(result)
    }).disposed(by: screen.disposeBag)
  }
}
