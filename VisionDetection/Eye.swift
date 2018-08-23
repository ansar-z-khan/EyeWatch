//
//  Eye.swift
//  VisionDetection
//
//  Created by Ansar Khan on 2018-08-10//

import Foundation
import UIKit

class Eye{
    var eye: [CGPoint]
    var pupil: CGPoint?
    
    var leftCorner: CGPoint?
    var  rightCorner: CGPoint?

    
    init(eye: [CGPoint], _pupil: [CGPoint] ){
        self.eye = eye;
//        leftCorner = nil
//        rightCorner = nil
//        pupil = nil
        let temp = getCorners(points: eye)
        leftCorner = temp.left
        rightCorner = temp.right
        pupil = averagePoints(points: _pupil)
    }
    
    private func getCorners(points: [CGPoint]) -> (left: CGPoint, right: CGPoint){
        var minXVal: CGFloat = 100;
        var maxXVal: CGFloat = -1;
        
        var minXIndex = -1;
        var maxXIndex = -1;
        for i in 0...points.count-1{
            let xVal = points[i].x
            if(xVal < minXVal){
                minXVal = xVal
                minXIndex = i;
            }
            else if(xVal > maxXVal){
                maxXVal = xVal
                maxXIndex = i;
            }
        }
        return (left: points[minXIndex], right: points[maxXIndex])
    }
    
    private func averagePoints(points: [CGPoint]) -> CGPoint{
        var x:CGFloat = 0.0;
        var y:CGFloat = 0.0;
        for point in points{
            x += point.x
            y += point.y
        }
        x /= CGFloat(points.count)
        y /= CGFloat(points.count)
        return CGPoint(x: x, y: y)
    }
    private func getLength(right: CGPoint, left: CGPoint)-> CGFloat {
        let length = ((right.x-left.x)*(right.x-left.x)+(right.y-left.y)*(right.y-left.y)).squareRoot()
        return length
    }
    private func getPOI(right: CGPoint, left: CGPoint, pupil: CGPoint)-> CGPoint {
        let m = (right.y-left.y)/(right.x-left.x)
        var mPerp: CGFloat = 0.0
        if m == 0.0 {
            mPerp = CGFloat.greatestFiniteMagnitude
        } else {
            mPerp = -1/m
        }
        let POI = CGPoint(x: (mPerp*pupil.x-pupil.y+m*left.x+left.y)/(mPerp-m), y: (m*((mPerp*pupil.x-pupil.y+m*left.x+left.y)/(mPerp-m)))-m*left.x+left.y)
        return POI
    }
    private func getPercent(right: CGPoint, left: CGPoint, pupil: CGPoint)-> (x: CGFloat, y: CGFloat) {
        let length = getLength(right: right, left: left)
        let POI = getPOI(right: right, left: left, pupil: pupil)
        let distanceX = ((POI.x-left.x)*(POI.x-left.x)+(POI.y-left.y)*(POI.y-left.y)).squareRoot()
        let distanceY = ((POI.x-pupil.x)*(POI.x-pupil.x)+(POI.y-pupil.y)*(POI.y-pupil.y)).squareRoot()
        return (x: (distanceX/length)*100, y: (distanceY/length)*100)
    }
    func getPercentX() -> CGFloat{
        return getPercent(right: rightCorner!, left: leftCorner!, pupil: pupil!).x
    }
    func getPercentY() -> CGFloat{
        return getPercent(right: rightCorner!, left: leftCorner!, pupil: pupil!).y
    }
    static func isCrossEyed(left: Eye,right: Eye) -> Bool{
        let yDiffPercent = left.getPercentY() / right.getPercentY()
        let xDiffPercent = left.getPercentX() / right.getPercentX()
        if (yDiffPercent > 1.2 || yDiffPercent < 0.8) {
            return true;
        }
        else if (xDiffPercent > 1.2 || xDiffPercent < 0.8){
            return true;
        }
        return false;
    
    }

    
}
