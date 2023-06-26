import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["안녕", "잘가"])
        segmented.selectedSegmentIndex = 0
        segmented.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        segmented.addUnderlineForSelectedSegment()
        return segmented
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    @objc func touchSegmented(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
    }
    
    func layout(){
        segmentedControl.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300.0)
        }
    }
    
    func setup(){
        
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        layout()
        segmentedControl.addTarget(self, action: #selector(touchSegmented), for: .valueChanged)
    }
}
