//
//  PageViewController.swift
//  luminous.ios
//
//  Created by Stephen Learmonth on 17/02/2022.
//

import UIKit

class PageViewController: UIPageViewController {

    var pageTitles = ["First Page", "Second Page", "Third Page", "Fourth page"]
    
    let controlVC = UIViewController()
    var completed = false
    
    override init(
      transitionStyle style: UIPageViewController.TransitionStyle,
      navigationOrientation: UIPageViewController.NavigationOrientation,
      options: [UIPageViewController.OptionsKey: Any]? = nil
    ) {
      super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .systemGray4
        pageControl.currentPageIndicatorTintColor = .systemGray
        pageControl.backgroundColor = .white
        
        dataSource = self
        delegate = self
        
        self.setViewControllers([setupContentVewController(index: 0)], direction: .forward, animated: true, completion: nil)

    }
    
    private func setupContentVewController(index: Int) -> UIViewController {
        let pageContentVC = PageContentVC()
        pageContentVC.configure(index: index, title: pageTitles[index])
        return pageContentVC
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let pageIndex = (viewController as? PageContentVC)?.index, pageIndex > 0 else { return nil }
      return setupContentVewController(index: pageIndex - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pageIndex = (viewController as? PageContentVC)?.index, pageIndex < pageTitles.count - 1 else {
        UserDefaults.standard.set(true, forKey: K.UserDefaultKeys.hasSeenOnboarding)
        completed = true
        return controlVC
      }
      return setupContentVewController(index: pageIndex + 1)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
      guard let pageContentVC = pageViewController.viewControllers?.first as? PageContentVC else { return 0 }
      return pageContentVC.index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
      if completed {
          let introductionVC = IntroductionVC()
          show(introductionVC, sender: nil)
      }
    }
}
