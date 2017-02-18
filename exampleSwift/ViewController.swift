//
//  ViewController.swift
//  exampleSwift
//
//  Created by Developer on 12/31/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit
let cellId = "cellId"
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
    let pageControl: UIPageControl = {
        let pagecontrol = UIPageControl()
        pagecontrol.pageIndicatorTintColor = UIColor.lightGray
        pagecontrol.currentPageIndicatorTintColor = UIColor.rbg(red: 247, green: 154, blue: 27)
        
        pagecontrol.numberOfPages = 3
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupViews()
        
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        //
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        _ = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)
        
        _ = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 30)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell
        let page = pages[indexPath.item]
        cell?.page = page
        return cell!
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

extension UIView {
    func anchorToTop(top:NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant:CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        // top
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        // bottom
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
        // left
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        // right
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}

