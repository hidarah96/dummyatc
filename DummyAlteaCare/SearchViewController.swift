//
//  SearchViewController.swift
//  DummyAlteaCare
//
//  Created by Rahmad Hidayat on 15/03/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tblvList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblvList.delegate = self
        tblvList.dataSource = self
        let nibList = UINib(nibName: "SearchPenyakitTableViewCell", bundle: nil)
        tblvList.register(nibList, forCellReuseIdentifier: "SearchPenyakitTableViewCell")
        tblvList.allowsSelection = true
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchPenyakitTableViewCell") as! SearchPenyakitTableViewCell
        cell.lbName.text = "Penyakit 1"
        return cell
        
    }
    
    
}
