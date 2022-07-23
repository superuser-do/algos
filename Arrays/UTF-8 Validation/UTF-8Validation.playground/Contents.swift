import Foundation

// A continuation byte is a byte that follows the starting byte of an n-byte sequence.
// A continuation byte must start with 10. A non-continuation byte must start with either 0, 110, 1110, or 11110.
// If a byte starts with 110 it means there must be 1 continuation byte that follows, 1110 -> 2 continuation bytes,
// and 11110 -> 3 continuation bytes.
func validUtf8(_ data: [Int]) -> Bool {
    // Keep track of how many continuation bytes are left
    // Start at 0 since we are not expecting any continuation bytes at the beginning.
    var contBytesLeft = 0
    
    for byte in data {
        if contBytesLeft == 0 {
            // If we don't expect any continuation bytes
            // then there are 4 valid case for the current byte
            // byte >> 5 gives us the first 3 bits (8 bits - 5 = 3).
            if byte >> 5 == 0b110 {
                // After seeing a byte that starts with 110,
                // we expect to see one continuation byte
                contBytesLeft = 1
            } else if byte >> 4 == 0b1110 {
                contBytesLeft = 2
            } else if byte >> 3 == 0b11110 {
                contBytesLeft = 3
            } else if byte >> 7 != 0 {
                return false
            }
        } else {
            // If we are expecting a continuation byte there is only one valid case.
            // It's invalid if the continuation byte doesn't start with 10
            if byte >> 6 != 0b10 {
                    return false
            }
                contBytesLeft -= 1
        }
    }
    
    return contBytesLeft == 0
}
validUtf8([197, 130, 1])
validUtf8([235, 140, 4])
