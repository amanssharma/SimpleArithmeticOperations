import XCTest
@testable import SimpleArithmeticOperations

final class SimpleArithmeticOperationsTests: XCTestCase {
    func testCalculateRoundedPercentages() {
        let sampleDouble01: [Double] = [18.56287425149701, 20.958083832335326, 18.56287425149701, 19.161676646706585, 22.75449101796407]
        let sampleDouble02: [Double] = [49.5, 50.5]
        let sampleDouble03: [Int: Double] = [0: 18.56287425149701, 1: 20.958083832335326, 2: 18.56287425149701, 3: 19.161676646706585, 4: 22.75449101796407]
        let sampleDouble04: [Int: Double] = [0: 49.5, 1: 50.5]
        let sampleDouble05: [Double] = [19.56287425149701, 20.958083832335326, 17.56287425149701, 19.161676646706585, 22.75449101796407]
        let sampleDouble06: [Int: Double] = [0: 19.56287425149701, 1: 20.958083832335326, 2: 17.56287425149701, 3: 19.161676646706585, 4: 22.75449101796407]
        let sampleDouble07: [Double] = [17.56287425149701, 20.958083832335326, 19.56287425149701, 19.161676646706585, 22.75449101796407]
        let sampleDouble08: [Int: Double] = [0: 17.56287425149701, 1: 20.958083832335326, 2: 19.56287425149701, 3: 19.161676646706585, 4: 22.75449101796407]
        let sampleDouble98: [Double] = [0.00000000000000, 0.00000000000000, 0.00000000000000]
        let sampleDouble99: [Int: Double] = [0: 0.00000000000000, 1: 0.00000000000000, 2: 0.00000000000000]
        
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble01).sorted(), [19, 21, 18, 19, 23].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble01).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble02), [49, 51])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble02).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble03).values.sorted(), [0: 18, 1: 21, 2: 19, 3: 19, 4: 23].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble03).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble04), [0: 49, 1: 51])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble04).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble05), [20, 21, 17, 19, 23])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble05).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble06), [0: 20, 1: 21, 2: 17, 3: 19, 4: 23])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble06).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble07), [17, 21, 20, 19, 23])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble07).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble08), [0: 17, 1: 21, 2: 20, 3: 19, 4: 23])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble08).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble98), [0, 0, 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble98).reduce(0) {$0 + $1}, 0)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble99), [0: 0, 1: 0, 2: 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleDouble99).values.reduce(0) {$0 + $1}, 0)
        
        let sampleFloat01: [Float] = [18.5, 20.9, 18.5, 19.1, 22.7]
        let sampleFloat02: [Int: Float] = [0: 18.5, 1: 20.9, 2: 18.5, 3: 19.1, 4: 22.7]
        let sampleFloat03: [Float] = [49.5, 50.5]
        let sampleFloat04: [Int: Float] = [0: 49.5, 1: 50.5]
        let sampleFloat05: [Float] = [19.5, 20.9, 17.5, 19.1, 22.7]
        let sampleFloat06: [Int: Float] = [0: 19.5, 1: 20.9, 2: 17.5, 3: 19.1, 4: 22.7]
        let sampleFloat07: [Float] = [17.5, 20.9, 19.5, 19.1, 22.7]
        let sampleFloat08: [Int: Float] = [0: 17.5, 1: 20.9, 2: 19.5, 3: 19.1, 4: 22.7]
        let sampleFloat98: [Float] = [0.0, 0.0, 0.0]
        let sampleFloat99: [Int: Float] = [0: 0.0, 1: 0.0, 2: 0.0]
        
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat01).sorted(), [18, 21, 19, 19, 23].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat01).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat02).values.sorted(), [0: 18, 1: 21, 2: 19, 3: 19, 4: 23].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat02).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat03).sorted(), [49, 51].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat03).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat04).values.sorted(), [0: 49, 1: 51].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat04).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat05).sorted(), [20, 21, 17, 19, 23].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat05).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat06).values.sorted(), [0: 20, 1: 21, 2: 17, 3: 19, 4: 23].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat06).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat07).sorted(), [17, 21, 20, 19, 23].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat07).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat08).values.sorted(), [0: 17, 1: 21, 2: 20, 3: 19, 4: 23].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat08).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat98), [0, 0, 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat98).reduce(0) {$0 + $1}, 0)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat99), [0: 0, 1: 0, 2: 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleFloat99).values.reduce(0) {$0 + $1}, 0)
        
        let sampleInt00: [Int] = []
        let sampleInt01: [Int: Int] = [:]
        let sampleInt02: [Int] = [18, 21, 18, 19, 22]
        let sampleInt03: [Int: Int] = [0: 18, 1: 21, 2: 18, 3: 19, 4: 22]
        let sampleInt04: [Int] = [49, 50]
        let sampleInt05: [Int: Int] = [0: 49, 1: 50]
        let sampleInt98: [Int] = [0, 0, 0]
        let sampleInt99: [Int: Int] = [0: 0, 1: 0, 2: 0]
        
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt00), [])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt00).reduce(0) {$0 + $1}, 0)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt01), [:])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt01).values.reduce(0) {$0 + $1}, 0)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt02).sorted(), [18, 22, 18, 19, 23].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt02).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt03).values.sorted(), [0: 18, 1: 22, 2: 18, 3: 19, 4: 23].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt03).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt04).sorted(), [49, 51].sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt04).reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt05).values.sorted(), [0: 49, 1: 51].values.sorted())
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt05).values.reduce(0) {$0 + $1}, 100)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt98), [0, 0, 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt98).reduce(0) {$0 + $1}, 0)
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt99), [0: 0, 1: 0, 2: 0])
        XCTAssertEqual(SimpleArithmeticOperations.calculateRoundedPercentages(of: sampleInt99).values.reduce(0) {$0 + $1}, 0)
    }
    
    static var allTests = [
        ("testExample", testCalculateRoundedPercentages),
    ]
}
