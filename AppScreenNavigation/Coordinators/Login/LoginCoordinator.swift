import RxSwift

class LoginCoordinator {
   // MARK: - Properties
  private let dependencyManager: LoginDependencyManager
  private let router: WindowRouter

  // MARK: - Initializer
  init(dependencyManager: LoginDependencyManager, router: WindowRouter) {
    self.dependencyManager = dependencyManager
    self.router = router
  }

  // MARK: - Methods
  func start() -> Observable<Void> {
    let loginViewController = dependencyManager.createLoginViewController()
    router.setRoot(loginViewController)
    return loginViewController.didTapLoginButton
  }
}
