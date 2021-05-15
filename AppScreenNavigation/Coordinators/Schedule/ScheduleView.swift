import UIKit
import RxSwift
import RxCocoa

class ScheduleView: UIView {
  // MARK: - Properties
  fileprivate let button1: UIButton = {
    let button1 = UIButton()
    button1.setTitle("Button 1", for: .normal)
    button1.backgroundColor = .blue
    return button1
  }()

  fileprivate let button2: UIButton = {
    let button2 = UIButton()
    button2.setTitle("Button 2", for: .normal)
    button2.backgroundColor = .brown
    return button2
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
}

// MARK: - Private Methods
extension ScheduleView {
  func setupUI() {
    let stackView = createStackView()
    let label = createLabel()
    addSubview(stackView)
    stackView.addArrangedSubview(label)
    stackView.addArrangedSubview(button1)
    stackView.addArrangedSubview(button2)
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
    label.text = "Schedule Screen"
    label.textAlignment = .center
    return label
  }
}

extension Reactive where Base: ScheduleView {
  var didTapButton1: Observable<Void> {
    base.button1.rx.tap.asObservable()
  }

  var didTapButton2: Observable<Void> {
    base.button2.rx.tap.asObservable()
  }
}
