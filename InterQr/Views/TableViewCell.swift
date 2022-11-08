
import UIKit
import SnapKit
import Lottie

class TableViewCell: UITableViewCell {
    static let identifire = "CustomTableViewCell"
    
    
    var animation = LottieAnimationView(name: "loading")
    var loadingAnimation = LottieAnimationView(name: "loadingCircle")
    var firstViewxib = UIView()
    var xibView = UIView()
    var circleImage = UIImageView()
    var lockImage = UIImageView()
    var frontDooreLabel = UILabel()
    var homeLabel = UILabel()
    var lockedLabel = UILabel()
    var imageSize: Int?
    var button = UIButton()
    var buttonImage = UIButton()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier )
        
        contentView.addSubview(firstViewxib)
        firstViewxib.backgroundColor = contentView.backgroundColor
        
        
        firstViewxib.addSubview(animation)
        
        
        
        animation.alpha = 0.7
        animation.play()
        animation.loopMode = .repeat(0.5)
        
        
        firstViewxib.addSubview(xibView)
        xibView.layer.borderWidth = 1
        xibView.layer.cornerRadius = 16
        xibView.layer.borderColor = CollorsSetings().greyBorderColor
        
        
        
        
        
        
        
        xibView.addSubview(circleImage)
        
        xibView.addSubview(lockImage)
        
        
        
        
        frontDooreLabel.text = "Front Door"
        xibView.addSubview(frontDooreLabel)
        
        frontDooreLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 16)
        frontDooreLabel.textColor = CollorsSetings().fontDoorColor
        
        
        homeLabel.text = "Home"
        xibView.addSubview(homeLabel)
        
        homeLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 14)
        homeLabel.textColor = CollorsSetings().greyColor
        
        lockedLabel.text = "Locked"
        xibView.addSubview(lockedLabel)
        
        lockedLabel.textAlignment = .center
        lockedLabel.font = UIFont(name: "Sk-Modernist-Bold", size: 16)
        lockedLabel.textColor = CollorsSetings().darkBlueColor
        
        xibView.addSubview(button)
        xibView.addSubview(buttonImage)
        buttonImage.setTitle("", for: .normal)
        buttonImage.backgroundColor = .none
        button.setTitle("", for: .normal)
        button.backgroundColor = .none
        
        buttonImage.addTarget(self, action: #selector(pressedButton), for: .touchDown)
        button.addTarget(self, action: #selector(pressedButton), for: .touchDown)
        
        xibView.alpha = 0
        animation.play { (finished) in
            self.animation.isHidden = true
            UIView.animate(withDuration: 0.7){
                self.xibView.alpha = 1
            }
        }
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        firstViewxib.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.bottom.equalTo(-7)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        animation.snp.makeConstraints { make in
            make.top.equalTo(firstViewxib).inset(25)
            make.left.equalTo(firstViewxib).inset(120)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        xibView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        circleImage.snp.makeConstraints { make in
            make.left.equalTo(xibView).inset(27)
            make.top.equalTo(xibView).inset(18)
            make.height.equalTo(41)
            make.width.equalTo(41)
        }
        lockImage.snp.makeConstraints { make in
            make.right.equalTo(xibView).inset(28)
            make.top.equalTo(xibView).inset(18)
            make.height.equalTo(imageSize ?? 45)
            make.width.equalTo(imageSize ?? 46)
        }
        buttonImage.snp.makeConstraints { make in
            make.right.equalTo(xibView).inset(28)
            make.top.equalTo(xibView).inset(18)
            make.height.equalTo(45)
            make.width.equalTo(46)
        }
        frontDooreLabel.snp.makeConstraints { make in
            make.left.equalTo(xibView).inset(82)
            make.top.equalTo(xibView).inset(22)
            make.right.equalTo(lockImage).inset(22)
            make.height.equalTo(19)
        }
        homeLabel.snp.makeConstraints { make in
            make.left.equalTo(xibView).inset(81)
            make.top.equalTo(xibView).inset(41)
            make.right.equalTo(lockImage).inset(22)
            make.height.equalTo(17)
        }
        
        lockedLabel.snp.makeConstraints { make in
            make.left.equalTo(xibView).inset(20)
            make.top.equalTo(xibView).inset(80)
            make.right.equalTo(xibView).inset(20)
            make.height.equalTo(17)
        }
        button.snp.makeConstraints { make in
            make.left.equalTo(xibView).inset(20)
            make.top.equalTo(xibView).inset(80)
            make.right.equalTo(xibView).inset(20)
            make.height.equalTo(17)
        }
        
    }
    @objc func pressedButton(sender: UIButton){
        self.lockedLabel.text? = "Unlocking..."
        self.lockedLabel.textColor = CollorsSetings().greyColor
        self.lockImage.image = UIImage(named: "loadImage")
        self.circleImage.image = UIImage(named: "pointsImage")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.lockedLabel.text? = "Unlocked"
            self.lockedLabel.textColor = CollorsSetings().blueColor
            self.lockImage.image = UIImage(named: "unlocked")
            self.circleImage.image = UIImage(named: "imageTwo")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.lockedLabel.text? = "Unlocked"
                self.lockedLabel.textColor = CollorsSetings().darkBlueColor
                self.lockImage.image = UIImage(named: "blueLock")
                self.circleImage.image = UIImage(named: "imageOne")
            }
            
        }
        
    }
}
