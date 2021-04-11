//
//  ViewController.swift
//  DummyAlteaCare
//
//  Created by Rahmad Hidayat on 10/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cvHomeFeature: UICollectionView!
    @IBOutlet weak var vSearch: CardView!
    @IBOutlet weak var ivPotoProfile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cvHomeFeature.delegate = self
        cvHomeFeature.dataSource = self
        let listNib = UINib.init(nibName: "HomeFeatureCollectionViewCell", bundle: nil)
        cvHomeFeature.register(listNib, forCellWithReuseIdentifier: "HomeFeatureCollectionViewCell")
        cvHomeFeature.reloadData()
        
        let searchAutoComplete = UITapGestureRecognizer(target: self, action: #selector(goToSearch))
        vSearch.addGestureRecognizer(searchAutoComplete)
        vSearch.isUserInteractionEnabled = true
        
    }

    @IBAction func goToSearch(){
        let vc = StoryboardScene.SearchSpecialist.SearchSpecialistViewController.instantiate()
//        let vc = StoryboardScene.Search.SearchViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFeatureCollectionViewCell", for: indexPath) as! HomeFeatureCollectionViewCell
        return cell
    }
    
    
}
