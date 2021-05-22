import UIKit
import RxSwift

class LoginScreen: UIFlowScreen {
  enum Result {
    case didTapLoginButton
  }

  // MARK: - Properties
  private let dependencyManager = LoginScreenDependencyManager()
  private lazy var loginViewController = dependencyManager.createLoginViewController()

  let identifier: UIFlowScreenIdentifier = .login
  let disposeBag = DisposeBag()

  var viewController: UIViewController {
    loginViewController
  }

  var didFinish: Observable<UIFlowEventInitializable> {
    loginViewController.didTapLoginButton.mapTo(Result.didTapLoginButton)
  }
}

extension LoginScreen.Result: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .loginScreen(self)
  }
}
