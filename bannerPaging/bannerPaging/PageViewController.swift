//
//  PageViewController.swift
//  bannerPaging
//
//  Created by 박준영 on 2021/12/27.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    lazy var pageViewController: UIPageViewController = {
            let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

            return vc
        }()
    
    var currentIndex: Int {
            guard let vc = viewControllers?.first else { return 0 }
            return viewList.firstIndex(of: vc) ?? 0
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
       if (!completed)
      {
        return
      }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewList.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 { return nil }
            return viewList[previousIndex]
        
        return viewList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewList.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == viewList.count { return nil }
            return viewList[nextIndex]
        
        return viewList[nextIndex]
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        

        if let firstvc = viewList.first {
            self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
