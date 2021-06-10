import Foundation

class StockMaximize {
    
    func makeProfit(prices: inout [Int], count: Int) -> Int {
        var maxPrice = 0
        var result = 0
        var i = 0
        var j = 0
        for val in prices
        {
            if (i < count && val >= 0)
            {
                maxPrice = val
                while (val <= prices[i + j] && maxPrice <= prices[i + j])
                {
                    maxPrice = prices[i + j]
                    j += 1
                }
                result += maxPrice - val
            }
            i += 1;
            j = 0;
        }
        return result
    }
    
    func countProfit(prices: [Int]) -> Int {
        if (prices.isEmpty || prices.count == 1) { return 0 }
        var array = prices
        array.append(0)
        var result = 0
        result = makeProfit(prices: &array, count: array.count - 1)
        return result
    }
}
