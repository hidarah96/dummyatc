//
//  SearchSpecialistViewController.swift
//  DummyAlteaCare
//
//  Created by Rahmad Hidayat on 17/03/21.
//

import UIKit

class SearchSpecialistViewController: UIViewController {
    @IBOutlet weak var tfSearchSpesialist: UITextField!
    
    @IBOutlet weak var tblvSpecialist: UITableView!
    var dataDoctor: [String] = []
    var dataDoctorFilter: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dataDoctor.removeAll()
        dataDoctorFilter.removeAll()
        dataDoctor.append("dr. satu")
        dataDoctor.append("dr. dua")
        dataDoctor.append("dr. tiga")
        dataDoctor.append("dr. empat")
        dataDoctor.append("dr. lima")
        tblvSpecialist.delegate = self
        tblvSpecialist.dataSource = self
        tblvSpecialist.reloadData()
//        tfSearchSpesialist.delegate = self
        tfSearchSpesialist.returnKeyType = .search
//        tfSearchBank.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        tfSearchSpesialist.addTarget(self, action: #selector(actionSearchSpesialist), for: UIControl.Event.editingChanged)
        
        setupCell()
    }
    
    func setupCell(){
        let nibSpecialist = UINib(nibName: "SpecialistTableViewCell", bundle: nil)
        tblvSpecialist.register(nibSpecialist, forCellReuseIdentifier: "SpecialistTableViewCell")
        tblvSpecialist.allowsSelection = true
    }
    
    @objc func actionSearchSpesialist(_ textField: UITextField) {
        print("searchSpesialist", textField.text ?? "")
        let result : String = textField.text ?? ""
        if result.isEmpty {
            dataDoctorFilter.removeAll()
        } else {
            dataDoctorFilter = dataDoctor.filter {$0.contains(result.lowercased())}
        }
        
        tblvSpecialist.reloadData()
//        let result: String = textField.text ?? ""
//        if result.isEmpty{
//            filterBankList.removeAll()
//        }else{
//            filterBankList = dataBankList.filter{($0.bankName?.lowercased().contains(result.lowercased()) ?? true)}
//        }
//        tblvListBank.reloadData()
    }
    
}

extension SearchSpecialistViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataDoctorFilter.isEmpty {
            return dataDoctor.count
        } else {
            return dataDoctorFilter.count
        }
        
//        if dataDoctor.isEmpty {
//            return dataDoctorFilter.count
//        } else {
//            return dataDoctor.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialistTableViewCell") as! SpecialistTableViewCell
        
        if dataDoctorFilter.isEmpty {
            cell.lbDoctorName.text = dataDoctor[indexPath.row]
        } else {
            cell.lbDoctorName.text = dataDoctorFilter[indexPath.row]
        }
        
        return cell
    }
    
    
}

extension SearchSpecialistViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("test Search", textField.text ?? "")
        return true
    }
}
