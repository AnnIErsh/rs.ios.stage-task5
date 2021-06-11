import UIKit

class MessageDecryptor: NSObject {
    
    func onlySmallEnglishLetters(myStr: String) -> Bool {
       for ch in myStr
       {
          if (!(ch >= "a" && ch <= "z")) { return false }
       }
       return true
    }
        
    func findBracket(text: inout String) {
        if (onlySmallEnglishLetters(myStr: text)) { return }
        let i = text.firstIndex(of: "]")
        let str = String(text[...(i ?? text.endIndex)])
        let j = str.lastIndex(of: "[")
        var substr = String(str[(j ?? str.endIndex)...])
        let substrToReplace = String(substr)
        substr.removeFirst()
        substr.removeLast()
        if (onlySmallEnglishLetters(myStr: substr))
        {
            let count = str.index(before: j ?? str.endIndex)
            var countIndex = count
            let checkFisrtIndex = str.startIndex
            var countStr = ""
            if (countIndex != checkFisrtIndex)
            {
                while (countIndex != checkFisrtIndex &&
                        str[countIndex] <= "9" && str[countIndex] >= "0")
                {
                    countIndex = str.index(before: countIndex)
                    countStr = String(str[str.index(after: countIndex)...count])
                }
            }
            else if (str[checkFisrtIndex] <= "9" && str[checkFisrtIndex] >= "0")
            {
                countIndex = checkFisrtIndex
                countStr = String(str[countIndex...count])
            }
            let numb = Int(countStr)
            if let check = numb
            {
                if (check > 300) { return }
            }
            let replacedStr = countStr + substrToReplace
            var newStr = ""
            if let n = numb
            {
                var m = 0
                while (m < n)
                {
                    newStr += substr
                    m += 1
                }
            }
            text = text.replacingOccurrences(of: replacedStr, with: newStr)
            findBracket(text: &text)
        }
    }
    
    func decryptMessage(_ message: String) -> String {
        if (message.isEmpty || message == "[]") { return "" }
        var text: String = message
        let index = text.startIndex
        if (text[index] == "[")
        {
            text.insert("1", at: index)
        }
        findBracket(text: &text)
        if (!onlySmallEnglishLetters(myStr: text)) { text =  "" }
        return text
    }
}
