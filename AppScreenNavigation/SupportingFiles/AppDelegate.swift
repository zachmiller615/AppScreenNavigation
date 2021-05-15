import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  // MARK: - Properties
  var window: UIWindow?

  // For coordinators design pattern
  private lazy var rootCoordinator: RootCoordinator = {
    let window = UIWindow()
    self.window = window
    return RootDependencyManager().createRootCoordinator(with: window)
  }()

  // For state machine design pattern
  private lazy var uiFlowDirector: UIFlowDirector = {
    let window = UIWindow()
    self.window = window
    return UIFlowDependencyManager().createUIFlowDirector(with: window)
  }()

  private let disposeBag = DisposeBag()

  // MARK: - Methods
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    /*
     Call one of these functions:
     - setupCoordinatorsDesignPattern()
     - setupStateMachineDesignPattern()
     */
    setupStateMachineDesignPattern()

    return true
  }
}

// MARK: - Private Methods
extension AppDelegate {
  private func setupCoordinatorsDesignPattern() {
    rootCoordinator.start()
  }

  private func setupStateMachineDesignPattern() {
    uiFlowDirector.start()
  }
}
