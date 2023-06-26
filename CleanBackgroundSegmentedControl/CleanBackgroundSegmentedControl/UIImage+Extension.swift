//
//  UIImage+Extension.swift
//  CleanBackgroundSegmentedControl
//
//  Created by 박준하 on 2023/06/26.
//
import Foundation
import UIKit

extension UIImage {
    
    // 비트맵으로 변환하는 함수
    // 색상과 크기를 요청하고 UIImage를 반환합니다.
    class func gerRectangleImageWith (color:CGColor, andSize size:CGSize) -> UIImage {
        
        // 색상과 크기를 요청하고 UIImage를 반환합니다.
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicContext = UIGraphicsGetCurrentContext()
        graphicContext?.setFillColor(color)
        
        // SC의 배경을 덮을 사각형 만들기
        
        let rectangle = CGRect (x: 0, y: 0, width: size.width, height: size.height)
        graphicContext?.fill(rectangle)
        
        // 컨텍스트에 사각형 넣기
        
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Return
        return rectangleImage!
    }
}
