import UIKit
import RxSwift

class LoginViewController: UIViewController {
  // MARK: - Properties
  private let loginView = LoginView()

  var didTapLoginButton: Observable<Void> {
    loginView.rx.didTapLoginButton
  }

  // MARK: - Methods
  override func loadView() {
    view = loginView
  }
}
