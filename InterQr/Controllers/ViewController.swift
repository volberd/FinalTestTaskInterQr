import SnapKit
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataOfDoors: [ViewOfDoors] = ViewDoorsList.list
    
    var doorTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initialize()
        
    }
    
    func initialize(){
        let framoForLogo = UIView()
        self.view.addSubview(framoForLogo)
        framoForLogo.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(77)
            make.height.equalTo(17)
            make.width.equalTo(86)
            framoForLogo.backgroundColor = view.backgroundColor
        }
        
        let interQrImage = UIImage(named: "interQRLogo")
        let logoIm = UIImageView(image: interQrImage)
        framoForLogo.addSubview(logoIm)
        logoIm.contentMode = .scaleAspectFill
        logoIm.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        let setViewBorder = UIView()
        view.addSubview(setViewBorder)
        setViewBorder.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(63)
            make.right.equalToSuperview().inset(27)
            make.height.equalTo(45)
            make.width.equalTo(45)
        }
        setViewBorder.layer.borderWidth = 1
        setViewBorder.layer.borderColor = CollorsSetings().greyBorderColor
        setViewBorder.layer.cornerRadius = 13
        let setingIcon = UIImageView(image: UIImage(named: "setingIcon"))
        setViewBorder.addSubview(setingIcon)
        setingIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(14)
            make.right.equalToSuperview().inset(14)
            make.top.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(14)
        }
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 35)
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(157)
            make.width.equalTo(148)
            make.height.equalTo(92)
        }
        welcomeLabel.textColor = .black
        let homeImage = UIImageView(image: UIImage(named: "logoHome"))
        view.addSubview(homeImage)
        homeImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(190)
            make.top.equalToSuperview().inset(128)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(148)
        }
        homeImage.contentMode = .scaleAspectFill
        
        let myDorsLAbel = UILabel()
        myDorsLAbel.text = "My doors"
        myDorsLAbel.font = UIFont(name: "Sk-Modernist-Bold", size: 20)
        view.addSubview(myDorsLAbel)
        myDorsLAbel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(307)
            make.width.equalTo(85)
            make.height.equalTo(24)
        }
        myDorsLAbel.textColor = CollorsSetings().darkBlueColor
        
        doorTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifire)
        doorTableView.delegate = self
        doorTableView.dataSource = self
        doorTableView.separatorStyle = .none
        
        view.addSubview(doorTableView)
        doorTableView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(350)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataOfDoors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = doorTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? TableViewCell else {fatalError("")}
        cell.homeLabel.text? = dataOfDoors[indexPath.row].placeOfDoor
        cell.lockedLabel.text? = dataOfDoors[indexPath.row].status
        cell.animation.loopMode = .repeat(dataOfDoors[indexPath.row].animationTime)
        cell.lockedLabel.textColor = dataOfDoors[indexPath.row].fontCollor
        cell.circleImage.image = UIImage(named: dataOfDoors[indexPath.row].leftImage)
        cell.lockImage.image = UIImage(named: dataOfDoors[indexPath.row].rigtImage)
        cell.imageSize = dataOfDoors[indexPath.row].imageSize
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        131.0
    }
}






