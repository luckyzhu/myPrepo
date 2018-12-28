//
//  BBAECaculateYAxisSpaceTool.swift
//  summary
//
//  Created by NewBoy on 2018/12/17.
//  Copyright © 2018年 LX. All rights reserved.
//

import Foundation

//找出合理的间距
extension Double
{
    /// Rounds the number to the nearest multiple of it's order of magnitude, rounding away from zero if halfway.
    func roundedToNextSignficant() -> Double
    {
        guard
            !isInfinite,
            !isNaN,
            self != 0
            else { return self }

        let d = ceil(log10(self < 0 ? -self : self))
        let pw = 1 - Int(d)
        let magnitude = pow(10.0, Double(pw))
        let shifted = (self * magnitude).rounded()
        return shifted / magnitude
    }
}


@objc class BBAECaculateYAxisSpaceTool:NSObject
{

     @objc public static func computeAxisValues(min: Double, max: Double)->([Double])
    {

        let yMin = min
        let yMax = max

        //默认是labelCount条线
        let labelCount = 4
        let range = abs(yMax - yMin)

        var entries = [Double]()

        // Find out how much spacing (in y value space) between axis values
        let rawInterval = range / Double(labelCount)
        var interval = rawInterval.roundedToNextSignficant()

        // Normalize interval
        let intervalMagnitude = pow(10.0, Double(Int(log10(interval)))).roundedToNextSignficant()
        let intervalSigDigit = Int(interval / intervalMagnitude)
        if intervalSigDigit > 5
        {
            // Use one order of magnitude higher, to avoid intervals like 0.9 or 90
            // if it's 0.0 after floor(), we use the old value
            interval = floor(10.0 * intervalMagnitude) == 0.0 ? interval : floor(10.0 * intervalMagnitude)
        }

        //ceil 返回大于或者等于指定表达式的最小整数
        //floor 取小于或者等于 x的最大整数
        var n = 0
        let first = interval == 0.0 ? 0.0 : ceil(yMin / interval) * interval
        let last = interval == 0.0 ? 0.0 : (floor(yMax / interval) * interval).nextUp

        if interval != 0.0 && last != first
        {
            for _ in stride(from: first, through: last, by: interval)
            {
                n += 1
            }
        }
        else if last == first && n == 0
        {
            n = 1
        }

            // Ensure stops contains at least n elements.
            entries.removeAll(keepingCapacity: true)
            entries.reserveCapacity(labelCount)

            var f = first
            var i = 0
            while i < n
            {
                if f == 0.0
                {
                    // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
                    f = 0.0
                }

                entries.append(Double(f))

                f += interval
                i += 1
            }

        return entries
    }

}

// 项目地址:https://github.com/danielgindi/Charts
//   原始代码如下
//    /// Sets up the axis values. Computes the desired number of labels between the two given extremes.
//    @objc open func computeAxisValues(min: Double, max: Double)
//    {
//        guard let axis = self.axis else { return }
//
//        let yMin = min
//        let yMax = max
//
//        let labelCount = axis.labelCount
//        let range = abs(yMax - yMin)
//
//        if labelCount == 0 || range <= 0 || range.isInfinite
//        {
//            axis.entries = [Double]()
//            axis.centeredEntries = [Double]()
//            return
//        }
//
//        // Find out how much spacing (in y value space) between axis values
//        let rawInterval = range / Double(labelCount)
//        var interval = rawInterval.roundedToNextSignficant()
//
//        // If granularity is enabled, then do not allow the interval to go below specified granularity.
//        // This is used to avoid repeated values when rounding values for display.
//        if axis.granularityEnabled
//        {
//            interval = interval < axis.granularity ? axis.granularity : interval
//        }
//
//        // Normalize interval
//        let intervalMagnitude = pow(10.0, Double(Int(log10(interval)))).roundedToNextSignficant()
//        let intervalSigDigit = Int(interval / intervalMagnitude)
//        if intervalSigDigit > 5
//        {
//            // Use one order of magnitude higher, to avoid intervals like 0.9 or 90
//            // if it's 0.0 after floor(), we use the old value
//            interval = floor(10.0 * intervalMagnitude) == 0.0 ? interval : floor(10.0 * intervalMagnitude)
//        }
//
//        var n = axis.centerAxisLabelsEnabled ? 1 : 0
//
//        // force label count
//        if axis.isForceLabelsEnabled
//        {
//            interval = Double(range) / Double(labelCount - 1)
//
//            // Ensure stops contains at least n elements.
//            axis.entries.removeAll(keepingCapacity: true)
//            axis.entries.reserveCapacity(labelCount)
//
//            var v = yMin
//
//            for _ in 0 ..< labelCount
//            {
//                axis.entries.append(v)
//                v += interval
//            }
//
//            n = labelCount
//        }
//        else
//        {
//            // no forced count
//
//            var first = interval == 0.0 ? 0.0 : ceil(yMin / interval) * interval
//
//            if axis.centerAxisLabelsEnabled
//            {
//                first -= interval
//            }
//
//
//            let last = interval == 0.0 ? 0.0 : (floor(yMax / interval) * interval).nextUp
//
//            if interval != 0.0 && last != first
//            {
//                for _ in stride(from: first, through: last, by: interval)
//                {
//                    n += 1
//                }
//            }
//            else if last == first && n == 0
//            {
//                n = 1
//            }
//
//            // Ensure stops contains at least n elements.
//            axis.entries.removeAll(keepingCapacity: true)
//            axis.entries.reserveCapacity(labelCount)
//
//            var f = first
//            var i = 0
//            while i < n
//            {
//                if f == 0.0
//                {
//                    // Fix for IEEE negative zero case (Where value == -0.0, and 0.0 == -0.0)
//                    f = 0.0
//                }
//
//                axis.entries.append(Double(f))
//
//                f += interval
//                i += 1
//            }
//        }
//
//        // set decimals
//        if interval < 1
//        {
//            axis.decimals = Int(ceil(-log10(interval)))
//        }
//        else
//        {
//            axis.decimals = 0
//        }
//
//        if axis.centerAxisLabelsEnabled
//        {
//            axis.centeredEntries.reserveCapacity(n)
//            axis.centeredEntries.removeAll()
//
//            let offset: Double = interval / 2.0
//
//            for i in 0 ..< n
//            {
//                axis.centeredEntries.append(axis.entries[i] + offset)
//            }
//        }
//    }


