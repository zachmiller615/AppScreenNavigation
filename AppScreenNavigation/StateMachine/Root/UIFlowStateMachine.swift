import RxSwift
import RxCocoa

class UIFlowStateMachine {
  // MARK: - Properties
  private let window: UIWindow

  private let events = PublishSubject<UIFlowEvent>()
  private let disposeBag = DisposeBag()

  private var screenStack = [UIFlowScreen]()

  // MARK: - Initializer
  init(window: UIWindow) {
    self.window = window
  }

  // MARK: - Methods
  func start() {
    setupInitialScreen()
    setupStateMachine()
  }
}

// MARK: - Private Methods
extension UIFlowStateMachine {
  private func setupInitialScreen() {
    let initialScreen = LoginScreen()
    let initialCommand = UIFlowCommand.setRoot(initialScreen)
    navigate(with: [initialCommand])
  }

  private func setupStateMachine() {
    events.subscribe(onNext: { [weak self] event in
      self?.transition(from: event)
    }).disposed(by: disposeBag)
  }

  private func transition(from event: UIFlowEvent) {
    guard let currentScreen = screenStack.last else { return }
    let commands = UIFlowReducer.transition(from: currentScreen, with: event)
    navigate(with: commands)
  }

  private func navigate(with commands: [UIFlowCommand]) {
    let router = UIFlowRouter(window: window, screenStack: screenStack)
    let routerResult = router.execute(commands)
    screenStack = routerResult.updatedScreenStack
    bindNewEvents(fromNewScreensAdded: routerResult.newScreensAdded)
  }

  private func bindNewEvents(fromNewScreensAdded newScreensAdded: [UIFlowScreen]) {
    for newScreenAdded in newScreensAdded {
      newScreenAdded.didFinish.toEvent.bind(to: events).disposed(by: newScreenAdded.disposeBag)
    }
  }
}
