//
//  OnboadingVC.swift
//  Todolist
//
//  Created by Abhi's Computers on 01/03/24.
//

import UIKit


class OnboadingVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
  
    

    @IBOutlet weak var Colletionview: UICollectionView!
    
    var Onscreen: [Onboadingdata] = [Onboadingdata(image: "Onboadingimg1", tital: "Manage your tasks", info: "You can easily manage all of your daily tasks in DoMe for free") , Onboadingdata(image: "Onboadingimg2", tital: "Create daily routine", info: "In Uptodo  you can create your personalized routine to stay productive") , Onboadingdata(image: "Onboadingimg3", tital: "Orgonaize your tasks", info: "You can organize your daily tasks by adding your tasks into separate categories")]
    var currentpage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.Colletionview.delegate = self
        self.Colletionview.dataSource = self
        self.Colletionview.register(UINib(nibName: "OnboadindimgCell", bundle: nil), forCellWithReuseIdentifier: "OnboadindimgCell") 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Onscreen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboadindimgCell", for: indexPath) as! OnboadindimgCell
        let index = Onscreen[indexPath.row]
        cell.imageview.image = UIImage(named: index.image)
        cell.tital.text = index.tital
        cell.info.text = index.info
        currentpage = indexPath.row
        return cell
    }
    
   
    
    @IBAction func nextbutton(_ sender: Any) {
        
        if currentpage < 2 {
            self.srcolltoNext(currentindex: currentpage)
        }
        else {
            let vc = UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "YSTabBar") 
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.srcolltoback(currentindex: currentpage)
    }
    //    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSize(width: Colletionview.frame.width, height: Colletionview.frame.height)
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        
//
//        let width = scrollView.frame.width
//        currentpage = Int(scrollView.contentOffset.x / width)
//        page
//        
//    }
    
    func srcolltoNext (currentindex: Int) {
        
        DispatchQueue.main.async {
            let index = IndexPath(item: currentindex + 1, section: 0)
            self.Colletionview.scrollToItem(at: index, at: .right, animated: true)
            self.Colletionview.reloadData()
        }
        
    }
    func srcolltoback (currentindex: Int) {
        
        DispatchQueue.main.async {
            let index = IndexPath(item: currentindex - 1, section: 0)
            self.Colletionview.scrollToItem(at: index, at: .left, animated: true)
            self.Colletionview.reloadData()
        }
        
    }

}
