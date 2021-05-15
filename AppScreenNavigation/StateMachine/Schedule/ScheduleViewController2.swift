import UIKit
import RxSwift

class ScheduleViewController2: UIViewController, UIFlowScreenFinishable {
  // MARK: - Properties
  private let scheduleView = ScheduleView()

  let disposeBag = DisposeBag()

  var didFinish: Observable<ScheduleScreenResult> {
    let didTapButton1 = scheduleView.rx.didTapButton1.mapTo(ScheduleScreenResult.didTapButton1)
    let didTapButton2 = scheduleView.rx.didTapButton2.mapTo(ScheduleScreenResult.didTapButton2)
    return Observable.merge(didTapButton1, didTapButton2)
  }

  // MARK: - Methods
  override func loadView() {
    view = scheduleView
  }
}
