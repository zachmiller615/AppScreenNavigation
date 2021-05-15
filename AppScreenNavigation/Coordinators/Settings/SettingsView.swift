import UIKit
import RxSwift
import RxCocoa

class SettingsView: UIView {
  // MARK: - Properties
  private let titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 3
    titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
    return titleLabel
  }()

  fileprivate let backButton: UIButton = {
    let backButton = UIButton()
    backButton.setTitle("Back", for: .normal)
    backButton.backgroundColor = .gray
    return backButton
  }()

  // MARK: - Initializers
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods
  func setTitle(to text: String) {
    titleLabel.text = text
  }
}

// MARK: - Private Methods
extension SettingsView {
  func setupUI() {
    let stackView = createStackView()
    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(backButton)
  }

  private func createStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    stackView.frame = CGRect(origin: .zero, size: size)
    return stackView
  }
}

extension Reactive where Base: SettingsView {
  var didTapBackButton: Observable<Void> {
    base.backButton.rx.tap.asObservable()
  }
}
