import UIKit
import RxSwift

class LoginViewController2: UIViewController, UIFlowScreenFinishable {
  // MARK: - Properties
  private let loginView = LoginView()

  let disposeBag = DisposeBag()

  var didFinish: Observable<LoginScreenResult> {
    loginView.rx.didTapLoginButton.mapTo(.didTapLoginButton)
  }

  // MARK: - Methods
  override func loadView() {
    view = loginView
  }
}
