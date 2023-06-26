//
//  SegmentedControl+Extension.swift
//  CleanBackgroundSegmentedControl
//
//  Created by 박준하 on 2023/06/26.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    
    //바탕지우는 코드
    
    func removeBorder(){
        
        // UIImageView를 사용해서 바탕제거
        let backgroundImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        
        // 모든 상태에 대한 설정
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        //UIImage 사용하여 구분선 제거
        let divisorImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        
        self.setDividerImage(divisorImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.purple], for: .selected)

        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
    }
    
    func addUnderlineForSelectedSegment() {
        // 배경 제거
        removeBorder()
        
        // 크기 및 위치 정의
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 2.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        
        // 밑줄 보기 만들기
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.purple
        underline.tag = 1
        
        self.addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        
        // 밑줄 확인
        guard let underline = self.viewWithTag(1) else {return}
    
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        
        // 슬라이드 애니메이션
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}
