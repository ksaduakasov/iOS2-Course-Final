//
//  ViewController.swift
//  simpleMusicApp
//
//  Created by Kalbek Saduakassov on 22.02.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var menu = [MenuModel.Entities.Menu.Section]() {
//        didSet {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
    var menu = [MenuEntity.Entities]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var sectionHeaders = ["Section #1", "Section #2", "Section #3"]
    
    //    var tempObj: TopTrack?
    //    var tempArr = [TopTrack]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        let nib =  UINib(nibName: "MusicCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        loadJSON()
    }
    
    
    
    
    func loadJSON(){
//        let headers: HTTPHeaders = [
//                "X-API-KEY": "555c2dc6020a31370d5d87972e6af956"
//        ]
        
        AF.request("https://foodbukka.herokuapp.com/api/v1/menu").responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let menuJSON = try JSONDecoder().decode(MenuEntity.self, from: data)
                        self.menu += menuJSON.result!
                        print(response)
                    } catch {
                        print(error)
                    }
                }
            case .failure:
                print("fail!")
            }
        }
//        AF.request("https://api.documenu.com/v2/restaurant/4072702673999819", headers: headers).responseJSON { response in
//            switch response.result {
//            case .success:
//                if let data = response.data {
//                    do {
//                        let menuJSON = try JSONDecoder().decode(MenuModel.self, from: data)
//                        self.menu += menuJSON.result!.menu[0].sections
//                        while self.menu[0].menuItems.count != self.menu.count {
//                            self.menu[0].menuItems.removeLast()
//                            self.sectionHeaders = self.menu[0].sectionName
//                        }
//                        print(self.menu.count)
//                        print(self.menu[0].menuItems.count)
//                    } catch {
//                        print(error)
//                    }
//                }
//            case .failure:
//                print("fail!")
//            }
//        }
    }
        
        
        
        @objc func goToFav() {
        }
        
        
        
        
    }
    
    
    
    
    extension ViewController: UITableViewDelegate,UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicCell
            //        cell.cellBg.backgroundColor = .red
            //        cell.sectionHeader.textColor = UIColor.white
            cell.sectionHeader.text = self.sectionHeaders[indexPath.row]
            
            //        let obj =  self.tracks[indexPath.row]
            cell.setCollectionViewDataSourceDelegate(index: indexPath,tracks: menu)
            //        cell.delegate = self
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 245
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("TableView:\(indexPath)")
        }
        
        
    }


//
//    fileprivate func isLatin(string: String) -> Bool {
//        let upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//        let lower = "abcdefghijklmnopqrstuvwxyz"
//            let characters = Array(string)
//                if !upper.contains(characters[0]) && !lower.contains(characters[0]) {
//                    return false
//                }
//            return true
//        }





