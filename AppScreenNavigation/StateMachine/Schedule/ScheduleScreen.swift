import UIKit
import RxSwift

class ScheduleScreen: UIFlowScreen {
  enum Result {
    case didTapButton1
    case didTapButton2
  }

  // MARK: - Properties
  private let dependencyManager = ScheduleScreenDependencyManager()
  private lazy var scheduleViewController = dependencyManager.createScheduleViewController()

  let identifier: UIFlowScreenIdentifier = .schedule
  let disposeBag = DisposeBag()

  var viewController: UIViewController {
    scheduleViewController
  }

  var didFinish: Observable<UIFlowEventInitializable> {
    let didTapButton1: Observable<UIFlowEventInitializable> = scheduleViewController.didTapButton1.mapTo(Result.didTapButton1)
    let didTapButton2: Observable<UIFlowEventInitializable> = scheduleViewController.didTapButton2.mapTo(Result.didTapButton2)
    return Observable.merge(didTapButton1, didTapButton2)
  }
}

extension ScheduleScreen.Result: UIFlowEventInitializable {
  var toEvent: UIFlowEvent {
    .scheduleScreen(self)
  }
}
