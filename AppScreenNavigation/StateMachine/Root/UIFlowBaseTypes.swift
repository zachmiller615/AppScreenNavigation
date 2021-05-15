import RxSwift

protocol UIFlowScreenFinishable {
  associatedtype Result: UIFlowEventInitializable

  var didFinish: Observable<Result> { get }
  var disposeBag: DisposeBag { get }
}

protocol UIFlowEventInitializable {
  var toEvent: UIFlowEvent { get }
}

struct UIFlowState {
  let screen: UIFlowScreen
  let segue: UIFlowSegue
}

extension UIFlowState: State {
  static var initial: UIFlowState {
    UIFlowState(screen: .login, segue: .setRoot)
  }
}

enum UIFlowSegue {
  case setRoot
  case present
  case dismiss
}
