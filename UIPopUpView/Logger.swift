

import Foundation

class Logger: NSObject {
    
    
    private class func privatePrint<T>(value: T, title: String, functionName: String, fileName: String, lineNumber: Int) {
        print("[\(title)][\((fileName as NSString).lastPathComponent):\(lineNumber)] \(value)")
    }
    
    // WEIGHT: 0
    class func debug<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        //        guard DEBUG != 0 else {
        //            return
        //        }
        privatePrint(value, title: "Debug", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    // WEIGHT: 0
    class func info<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Info", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    // WEIGHT: 2
    class func warning<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Warning", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
    // WEIGHT: 4
    class func error<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Error", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    
}

// MARK: - Response
extension Logger {
    
    // WEIGHT: 0
    class func success<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Success", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
    // WEIGHT: 1
    class func failure<T>(value: T, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Failure", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }
}

// MARK: - Assert
extension Logger {
    
    // WEIGHT: 5+
    class func assert(value: String, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        privatePrint(value, title: "Assert", functionName: functionName, fileName: fileName, lineNumber: lineNumber)
        assertionFailure(value)
        
    }
    // WEIGHT: 5+
    class func assert(flag: Bool, value:String, functionName: String = __FUNCTION__, fileName: String = __FILE__, lineNumber: Int = __LINE__) {
        if !flag {
            assert(value, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
        }
    }
}