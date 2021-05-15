class LoginDependencyManager {
  func createLoginCoordinator(with router: WindowRouter) -> LoginCoordinator {
    LoginCoordinator(dependencyManager: self, router: router)
  }

  func createLoginViewController() -> LoginViewController {
    LoginViewController()
  }
}
