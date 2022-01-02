//
//  PagingViewController.swift
//  bannerPaging
//
//  Created by 박준영 on 2021/12/27.
//

import UIKit

class PagingViewController: UIPageViewController {
    

    var PageViewControllerList = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageViewController()
        
    }
    
    // MARK: Pageview를 구성할 ViewController 생성
       func createPageViewController()
       {
           let vc1 = UIViewController()
           vc1.view.backgroundColor = UIColor.purple
           
           let vc2 = UIViewController()
           vc2.view.backgroundColor = UIColor.systemIndigo
           
           let vc3 = UIViewController()
           vc3.view.backgroundColor = UIColor.orange
           
           let vc4 = UIViewController()
           vc4.view.backgroundColor = UIColor.lightGray
           
           PageViewControllerList.append(vc1)
           PageViewControllerList.append(vc2)
           PageViewControllerList.append(vc3)
           PageViewControllerList.append(vc4)
       }
       
    // MARK: PageViewController 설정
        func setupPageViewController()
        {
            // MARK: PageViewController DataSource 연결
            self.dataSource = self
            
            //첫번째로 위치할 ViewController 배치
            if let firstviewController = PageViewControllerList.first
            {
                setViewControllers([firstviewController],
                                   direction: .forward,
                                   animated: true,
                                   completion: nil)
            }
        }
}

extension PagingViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource
{
    //이전 페이지 뷰 컨트롤러
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //해당페이지의 인덱스넘버
        guard let viewControllerIndex = PageViewControllerList.firstIndex(of: viewController) else
        {
            return nil
        }
        //이전페이지는 해당페이지의 인덱스넘버 -1
        let previousIndex = viewControllerIndex - 1
        // if : 0보다 작아지면 마지막 번호로
        guard previousIndex >= 0 else
        {
            return PageViewControllerList.last
        }
        // if : 0보다 작아지면 마지막 번호로
        guard PageViewControllerList.count > previousIndex else
        {
            return nil
        }
        return PageViewControllerList[previousIndex]
    }
    //이후 페이지 뷰 컨트롤러
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = PageViewControllerList.firstIndex(of: viewController) else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard PageViewControllerList.count != nextIndex else
        {
            return PageViewControllerList.first
        }
        
        guard PageViewControllerList.count > nextIndex else
        {
            return nil
        }
        
        return PageViewControllerList[nextIndex]
        
    }
    
}
