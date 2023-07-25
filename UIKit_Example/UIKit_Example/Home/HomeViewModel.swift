//
//  HomeViewModel.swift
//  UIKit_Example
//
//  Created by 윤지호 on 2023/07/25.
//

import Foundation

struct TempInfo {
    var name: String
    var isSpecial: Bool
}



class HomeViewModel {
    let recommendMenus: [TempInfo] = [
        TempInfo(name: "  재주문 많아요  ", isSpecial: false),
        TempInfo(name: "  알뜰배달 런칭  ", isSpecial: true),
        TempInfo(name: "  쿠폰받기  ", isSpecial: false),
        TempInfo(name: "  면요리  ", isSpecial: false),
        TempInfo(name: "  무더위 간식  ", isSpecial: false),
        TempInfo(name: "  고객 추천가게  ", isSpecial: false),
        TempInfo(name: "  혼밥집  ", isSpecial: false)
    ]
    
    let firstRecommends: [String] = [
        "쇼핑라이브" , "전국별미", "선물하기", "웹툰"
    ]
}
