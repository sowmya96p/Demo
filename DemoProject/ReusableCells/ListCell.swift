//
//  ListCell.swift
//  DemoProject
//
//  Created by sowmya P on 12/09/21.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var sizeText: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var listText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayData(viewModel: ListViewModel, index: Int) {
        if viewModel.sizesArray.count > index {
            self.listText.text = viewModel.urlString[index]
            self.sizeText.text =  viewModel.sizesArray[index]
            if viewModel.httpResponse != nil {
            self.listImage.image = UIImage(named: viewModel.images[index] )
            }else {
                self.listImage.image = UIImage(named:"Failure")
            }
            self.listImage.isHidden = false
            self.sizeText.isHidden = false
        }else {
            if (viewModel.sizesArray.count  == 8 ) , viewModel.sizesArray.count != 0 {
                self.listText.text = viewModel.urlString[index]
                self.sizeText.text =  viewModel.sizesArray[index]
                if viewModel.httpResponse != nil {
                self.listImage.image = UIImage(named: viewModel.images[index] )
                }else {
                    self.listImage.image = UIImage(named:"Failure")
                }
                self.listImage.isHidden = false
                self.sizeText.isHidden = false
            }
            self.listText.text = viewModel.urlString[index]
            self.listImage.isHidden = true
            self.sizeText.isHidden = true
            
        }
        
    }
    
    
}
