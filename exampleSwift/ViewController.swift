//
//  ViewController.swift
//  exampleSwift
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit
let cellId = "cellId"
let loginCellId = "loginCellId"
var pageControlBottomAnchor: NSLayoutConstraint?
var skipControlTopAnchor: NSLayoutConstraint?
var nextControlTopAnchor: NSLayoutConstraint?
class ViewController: UIViewController {
    // MARK: ----------------------define control
    // 1.
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    // 2.
    lazy var pageControl: UIPageControl = {
        let pagecontrol = UIPageControl()
        pagecontrol.pageIndicatorTintColor = UIColor.lightGray
        pagecontrol.currentPageIndicatorTintColor = UIColor.rbg(red: 247, green: 154, blue: 27)
        
        pagecontrol.numberOfPages = self.pages.count + 1
        return pagecontrol
    }()
    // 3.
    let skipButton: UIButton = {
        let skipBtn = UIButton(type: .system)
        skipBtn.setTitle("Skip", for: .normal)
        skipBtn.setTitleColor(UIColor.rbg(red: 247, green: 154, blue: 27), for: .normal)
        return skipBtn
    }()
    // 4.
    let nextButton: UIButton = {
        let nextBtn = UIButton(type: .system)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleColor(UIColor.rbg(red: 247, green: 154, blue: 27), for: .normal)
        return nextBtn
    }()
    
    // MARK: ----------------------define data
    let pages:[Page] = {
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us", imageName: "page1")
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this book\"", imageName: "page2")
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        return [firstPage, secondPage, thirdPage]
    }()
    
    // MARK: ----------------------define self.method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupViews()
        self.registerCell()
        
    }
    
    fileprivate func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        //
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        pageControlBottomAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)?[1]
        
        skipControlTopAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)?.first
        
        nextControlTopAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)?.first
        
    }
    
    fileprivate func registerCell() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == self.pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell
        let page = pages[indexPath.row]
        cell?.page = page
        return cell!
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        if pageNumber == self.pages.count {
            pageControlBottomAnchor?.constant = 40
            skipControlTopAnchor?.constant = -40
            nextControlTopAnchor?.constant = -40
        } else {
            pageControlBottomAnchor?.constant = 0
            skipControlTopAnchor?.constant = 16
            nextControlTopAnchor?.constant = 16
        }
//        UIView.animate(withDuration: 0.9, animations: {
//            self.view.layoutIfNeeded()
//        })
        
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

