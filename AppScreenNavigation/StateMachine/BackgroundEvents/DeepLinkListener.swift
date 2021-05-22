import RxSwift

class DeepLinkListener {
  var didReceiveDeepLink: Observable<Void> {
    Observable<Int>.timer(.seconds(5), scheduler: MainScheduler.instance).mapTo(())
  }
}