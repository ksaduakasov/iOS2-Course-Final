//
//  MusicCell.swift
//  simpleMusicApp
//
//  Created by Kalbek Saduakassov on 22.02.2021.
//

import UIKit
import Kingfisher

protocol MusicCellProtocol {
    func didTapSeeAll(cell:MusicCell,indexPath:IndexPath)
    func didTapOnTrack(cell:MusicCell,indexPath:IndexPath)
}


class MusicCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            let nib = UINib(nibName: "TrackCell", bundle: nil)
            self.collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        }
    }
    
    @IBOutlet weak var sectionHeader: UILabel!
    @IBOutlet weak var cellBg: UIView!
    
    var indexPath:IndexPath?
    var delegate:MusicCellProtocol? = nil
    var topTracks:[MenuEntity.Entities]?  //json file
    var posterURL: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setCollectionViewDataSourceDelegate(index:IndexPath,tracks:[MenuEntity.Entities]){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        indexPath = index
        topTracks =  tracks
        self.collectionView.reloadData()
        
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topTracks!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrackCell
        
        let obj = topTracks?[indexPath.row]
//        cell.artistName.text = obj?.menuItems[indexPath.row].itemName
//        cell.trackName.text = obj?.menuItems[indexPath.row].description
        cell.trackName.text = obj?.menuname
        cell.artistName.text = obj?.description
        let posterURL = URL(string: (obj?.images[indexPath.row % 3])!)
        cell.coverImage.kf.setImage(with: posterURL)
        


            //            cell.coverImage.setImageWithUrl(url: NSURL(string:(obj?.artWork)!)!)
            return cell
            
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Coll:\(indexPath) - \(String(describing: self.indexPath))")
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            if let vc = storyboard.instantiateViewController(withIdentifier: "details") as? DetailsViewController {
                vc.object = topTracks![indexPath.row]

                vc.posterURL = topTracks![indexPath.row].images[indexPath.row % 3]
                print(topTracks![indexPath.row].id!)
                
    
                self.window?.rootViewController?.present(vc, animated: true, completion: nil)
//            if let _ = delegate{
//                delegate?.didTapOnTrack(cell: self, indexPath: indexPath)
//            }
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 120, height: 185)
        }
        
        
        
    }


