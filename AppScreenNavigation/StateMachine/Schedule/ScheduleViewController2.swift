import UIKit
import RxSwift

class ScheduleViewController2: UIViewController {
  // MARK: - Properties
  private let scheduleView = ScheduleView()

  var didTapButton1: Observable<Void> {
    scheduleView.rx.didTapButton1
  }

  var didTapButton2: Observable<Void> {
    scheduleView.rx.didTapButton2
  }

  // MARK: - Methods
  override func loadView() {
    view = scheduleView
  }
}
