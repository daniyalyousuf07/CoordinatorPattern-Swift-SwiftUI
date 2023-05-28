//
//  CatListCell.swift
//  CoordinatorPatternDemo
//
//  Created by Daniyal Yousuf on 2023-05-28.
//

import UIKit

final class CatListCell: UITableViewCell {
    
    @IBOutlet weak private var lblName: UILabel!
    
    private var data: CatBreedElement? = nil {
        didSet {
            if let data = data {
                name = data.name
            }
        }
    }
    
    private var name: String = "" {
        didSet {
            lblName.text = name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(data: CatBreedElement) {
        self.data = data
    }
    
}
