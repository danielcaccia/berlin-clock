//
//  BerlinClockViewModel.swift
//  Berlin-Clock
//
//  Created by Daniel Caccia on 22/01/2023.
//

import Foundation

class BerlinClockViewModel {
    var singleMinuteBlocks: Int = 0
    var fiveMinuteBlocks: Int = 0
    var singleHourBlocks: Int = 0
    var fiveHoursBlocks: Int = 0
    var secondsBlock: BlockMode = .off
    var currentTime: String = ""

    func generateClock() {
        let now = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "HH:MM:ss"
        
        let minutes = calendar.component(.minute, from: now)
        let hours = calendar.component(.hour, from: now)
        let seconds = calendar.component(.second, from: now)
        
        singleMinuteBlocks = singleMinuteBlocks(for: minutes)
        fiveMinuteBlocks = fiveMinuteBlocks(for: minutes)
        singleHourBlocks = singleHourBlocks(for: hours)
        fiveHoursBlocks = fiveHourBlocks(for: hours)
        setSecondsBlock(for: seconds)
        currentTime = dateFormatter.string(from: now)
    }
    
    private func singleMinuteBlocks(for minutes: Int) -> Int {
        switch minutes % 10 {
        case 1, 6:
            return 1
        case 2, 7:
            return 2
        case 3, 8:
            return 3
        case 4, 9:
            return 4
        default:
            return 0
        }
    }
    
    private func fiveMinuteBlocks(for minutes: Int) -> Int {
        switch minutes / 10 {
        case _ where minutes < 5:
            return 0
        case _ where minutes < 10:
            return 1
        case _ where minutes < 15:
            return 2
        case _ where minutes < 20:
            return 3
        case _ where minutes < 25:
            return 4
        case _ where minutes < 30:
            return 5
        case _ where minutes < 35:
            return 6
        case _ where minutes < 40:
            return 7
        case _ where minutes < 45:
            return 8
        case _ where minutes < 50:
            return 9
        case _ where minutes < 55:
            return 10
        default:
            return 11
        }
    }
    
    private func singleHourBlocks(for hours: Int) -> Int {
        switch hours % 10 {
        case 1, 6:
            return 1
        case 2, 7:
            return 2
        case 3, 8:
            return 3
        case 4, 9:
            return 4
        default:
            return 0
        }
    }
    
    private func fiveHourBlocks(for hours: Int) -> Int {
        switch hours {
        case _ where hours < 5:
            return 0
        case _ where hours < 10:
            return 1
        case _ where hours < 15:
            return 2
        case _ where hours < 20:
            return 3
        default:
            return 4
        }
    }
    
    private func setSecondsBlock(for seconds: Int) {
        secondsBlock = seconds % 2 == 0 ? .yellow : .off
    }
}
