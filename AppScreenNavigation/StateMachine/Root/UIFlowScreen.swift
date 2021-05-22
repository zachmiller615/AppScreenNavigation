import UIKit
import RxSwift

protocol UIFlowScreen {
  var identifier: UIFlowScreenIdentifier { get }
  var viewController: UIViewController { get }
  var didFinish: Observable<UIFlowEventInitializable> { get }
  var disposeBag: DisposeBag { get }
}

enum UIFlowScreenIdentifier {
  case login
  case schedule
  case settings
}
