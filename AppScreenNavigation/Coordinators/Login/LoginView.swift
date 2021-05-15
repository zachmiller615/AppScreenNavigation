import UIKit
import RxSwift
import RxCocoa

class LoginView: UIView {
  // MARK: - Properties
  fileprivate let loginButton: UIButton = {
    let loginButton = UIButton()
    loginButton.setTitle("Login", for: .normal)
    loginButton.backgroundColor = .blue
    return loginButton
  }()

  // MARK: - Initializers
  init() {
    super.init(frame: .zero)
    backgroundColor = .gray
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
extension LoginView {
  private func setupUI() {
    let stackView = createStackView()
    let label = createLabel()
    addSubview(stackView)
    stackView.addArrangedSubview(label)
    stackView.addArrangedSubview(loginButton)
  }

  private func createStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    stackView.frame = CGRect(origin: .zero, size: size)
    return stackView
  }

  private func createLabel() -> UILabel {
    let label = UILabel()
    label.text = "Login Screen"
    label.textAlignment = .center
    return label
  }
}

extension Reactive where Base: LoginView {
  var didTapLoginButton: Observable<Void> {
    base.loginButton.rx.tap.asObservable()
  }
}
