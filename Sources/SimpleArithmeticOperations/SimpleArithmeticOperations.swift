import Foundation

/// Provides utility methods using simple arithmetic operations commonly required at UI layer.
public struct SimpleArithmeticOperations {
    // MARK: - Public API
    
    // MARK: Pecentage calculation
    
    /// Calculates percentages as Int values, for an array of Double values, such that sum of percentages is 100.
    /// The order of percentage values returned corresponds to the order of the values in the input array.
    /// - Parameter numbers: A list of Double values for which percentages need to be calculated.
    /// - Returns: A list of Int values representing the percentages of each of the values in the |numbers| list.
    public static func calculateRoundedPercentages(of numbers: [Double]) -> [Int] {
        var percentagesMap: [Int: Double] = [:]
        
        // prepare percentages map
        let total = numbers.reduce(0) { $0 + $1 }
        
        // prevent divide by zero
        guard total > 0 else {
            return numbers.map { Int($0 * 0) }
        }
        
        for (i, number) in numbers.enumerated() {
            percentagesMap[i] = (Double(number) / Double(total)) * 100.0
        }
        
        let roundedPercentagesMap = roundOffPercentagesTo100(percentagesMap)
        let roundedPercentages = percentagesMap.keys.sorted().map {
            roundedPercentagesMap[$0]
        }.compactMap { $0 }
        
        return roundedPercentages
    }
    
    /// Takes as input a dictionary where the values represent the set of numbers for which the percentage has to be calculated.
    /// The method calculates the percentages and in a manner that the sum of percentages equals 100.
    /// - Parameter input: A dictionary where the values represent a set of numbers whose percentage needs to be calculated.
    /// - Returns: A dictionary which maps the keys in |input| to rounded off Int values representing the percentages.
    public static func calculateRoundedPercentages<T: Hashable>(of input: [T: Double]) -> [T: Int] {
        var percentagesMap: [T: Double] = [:]
        
        // prepare percentages map
        let total = input.values.reduce(0) { $0 + $1 }
        
        // prevent divide by zero
        guard total > 0 else {
            var zeroPercentages: [T: Int] = [:]
            _ = input.map { zeroPercentages[$0.key] = 0 }
            return zeroPercentages
        }
        
        _ = input.map {
            percentagesMap[$0.key] = (Double($0.value) / Double(total)) * Double(100)
        }
        
        let roundedPercentagesMap = roundOffPercentagesTo100(percentagesMap)
        
        return roundedPercentagesMap
    }
    
    /// Calculates percentages as Int values, for an array of Float values, such that sum of percentages is 100.
    /// The order of percentage values returned corresponds to the order of the values in the input array.
    /// - Parameter numbers: A list of Float values for which percentages need to be calculated.
    /// - Returns: A list of Int values representing the percentages of each of the values in the |numbers| list.
    public static func calculateRoundedPercentages(of numbers: [Float]) -> [Int] {
        // prepare percentages map
        let total = numbers.reduce(0) { $0 + $1 }
        
        // prevent divide by zero
        guard total > 0 else {
            return numbers.map { Int($0 * 0) }
        }
        
        return calculateRoundedPercentages(of: numbers.map { Double($0) })
    }
    
    /// Takes as input a dictionary where the values represent accurate Double percentages for a given list of numbers, and
    /// returns a dictionary containing the Double values rounded off to Int values, such that the sum of percentages is as
    /// close to 100 as possible.
    /// - Parameter input: A dictionary where the values represent a set of percentages of a given list of numbers.
    /// - Returns: A dictionary which maps the keys in |input| to rounded off Int values representing the percentages.
    public static func calculateRoundedPercentages<T: Hashable>(of input: [T: Float]) -> [T: Int] {
        // prepare percentages map
        let total = input.values.reduce(0) { $0 + $1 }
        
        // prevent divide by zero
        guard total > 0 else {
            var zeroPercentages: [T: Int] = [:]
            _ = input.map { zeroPercentages[$0.key] = 0 }
            return zeroPercentages
        }
        
        var castedInput: [T: Double] = [:]
        _ = input.map { castedInput[$0.key] = Double($0.value) }
        return calculateRoundedPercentages(of: castedInput)
    }
    
    /// Calculates percentages as Int values, for an array of Int values, such that sum of percentages is 100.
    /// The order of percentage values returned corresponds to the order of the values in the input array.
    /// - Parameter numbers: A list of Int values for which percentages need to be calculated.
    /// - Returns: A list of Int values representing the percentages of each of the values in the |numbers| list.
    public static func calculateRoundedPercentages(of numbers: [Int]) -> [Int] {
        // prepare percentages map
        let total = numbers.reduce(0) { $0 + $1 }
        
        // prevent incorrect percentage calculation
        guard total > 0 else {
            return numbers.map { Int($0 * 0) }
        }
        
        return calculateRoundedPercentages(of: numbers.map { Double($0) })
    }
    
    /// Takes as input a dictionary where the values represent accurate Double percentages for a given list of numbers, and
    /// returns a dictionary containing the Double values rounded off to Int values, such that the sum of percentages is as
    /// close to 100 as possible.
    /// - Parameter input: A dictionary where the values represent a set of percentages of a given list of numbers.
    /// - Returns: A dictionary which maps the keys in |input| to rounded off Int values representing the percentages.
    public static func calculateRoundedPercentages<T: Hashable>(of input: [T: Int]) -> [T: Int] {
        // prepare percentages map
        let total = input.values.reduce(0) { $0 + $1 }
        
        // prevent divide by zero
        guard total > 0 else {
            var zeroPercentages: [T: Int] = [:]
            _ = input.map { zeroPercentages[$0.key] = 0 }
            return zeroPercentages
        }
        
        var castedInput: [T: Double] = [:]
        _ = input.map { castedInput[$0.key] = Double($0.value) }
        return calculateRoundedPercentages(of: castedInput)
    }
    
    // MARK: - Private members
    
    // MARK: Pecentage calculation
    
    private static func roundOffPercentagesTo100<T: Hashable>(_ percentageMap: [T: Double]) -> [T: Int] {
        var roundedPercentages: [T: Int] = [:]
        
        let sortedMap = percentageMap.sorted {
            var isGreater = false
            
            let decimalPartA = abs(floor($0.value) - $0.value)
            let decimalPartB = abs(floor($1.value) - $1.value)
            let integerPartA = abs($0.value - decimalPartA)
            let integerPartB = abs($1.value - decimalPartB)
            
            if (decimalPartA == decimalPartB && integerPartA > integerPartB) ||
                decimalPartA > decimalPartB {
                isGreater = true
            }
            
            return isGreater
        }
        
        let diff = Int(abs(100 - percentageMap.values.map { floor($0) }.reduce(0) { $0 + $1 }))
        
        for (index, element) in sortedMap.enumerated() {
            roundedPercentages[element.key] = index < diff ? Int(element.value) + 1 : Int(element.value)
        }
        
        return roundedPercentages
    }
}
