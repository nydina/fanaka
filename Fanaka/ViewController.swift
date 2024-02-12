import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var furnitureImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftArrowImageView: UIImageView!
    @IBOutlet weak var rightArrowImageView: UIImageView!

    var currentFurnitureIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Enable user interaction for the image views
        leftArrowImageView.isUserInteractionEnabled = true
        rightArrowImageView.isUserInteractionEnabled = true

        // Add tap gesture recognizers to the image views
        let leftTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftArrowImageViewTapped))
        leftArrowImageView.addGestureRecognizer(leftTapGestureRecognizer)

        let rightTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightArrowImageViewTapped))
        rightArrowImageView.addGestureRecognizer(rightTapGestureRecognizer)
    }

    func updateUI() {
        let currentFurniture = furnitures[currentFurnitureIndex]
        furnitureImageView.image = UIImage(named: currentFurniture.image)
        descriptionLabel.text = currentFurniture.description
    }

    @objc func leftArrowImageViewTapped() {
        if currentFurnitureIndex > 0 {
            currentFurnitureIndex -= 1
            updateUI()
        }
    }

    @objc func rightArrowImageViewTapped() {
        if currentFurnitureIndex < furnitures.count - 1 {
            currentFurnitureIndex += 1
            updateUI()
        }
    }
}
