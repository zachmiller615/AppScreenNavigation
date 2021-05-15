import UIKit
import RxSwift

class RootCoordinator {
  // MARK: - Properties
  private let dependencyManager: RootDependencyManager
  private let router: WindowRouter
  private let disposeBag = DisposeBag()

  private var scheduleCoordinator: ScheduleCoordinator?

  // MARK: - Initializer
  init(dependencyManager: RootDependencyManager, router: WindowRouter) {
    self.dependencyManager = dependencyManager
    self.router = router
  }

  // MARK: - Methods
  func start() {
    navigateToLogin().subscribe().disposed(by: disposeBag)
  }
}

// MARK: - Private Methods
extension RootCoordinator {
  private func navigateToLogin() -> Observable<Void> {
    let loginCoordinator = LoginDependencyManager().createLoginCoordinator(with: router)
    return loginCoordinator.start().withUnretained(self).flatMapLatest { strongSelf, _ in
      strongSelf.navigateToSchedule()
    }
  }

  private func navigateToSchedule() -> Observable<Void> {
    let scheduleCoordinator = ScheduleDependencyManager().createScheduleCoordinator(with: router)
    self.scheduleCoordinator = scheduleCoordinator
    return scheduleCoordinator.start()
  }
}
