//
//  Model.swift
//  Puzzles
//
//  Created by 杜俊楠 on 2022/10/18.
//

import Foundation

class QuestionBank: NSObject {
    
    var questionArray = [Question]()
    
    override init() {
        let item = Question.init(text: "烧烤和啤酒会不会食物中毒", answer: true)
        questionArray.append(item)
        questionArray.append(Question.init(text: "喝白酒是最好喝茶水", answer: false))
        questionArray.append(Question.init(text: "空腹最好不吃柿子", answer: true))
        questionArray.append(Question.init(text: "在野外遇到雷雨天气时,感觉自己的头发竖起来了,皮肤发热,要立即趴下,不要站立", answer: true))
        questionArray.append(Question.init(text: "参加运动会,临赛前一定要吃饱,这样跑起来才有力气", answer: false))
        questionArray.append(Question.init(text: "面膜做的时间越久越好", answer: false))
        questionArray.append(Question.init(text: "晕船时应尽量固定头部,不要让头部来回晃动", answer: true))
        questionArray.append(Question.init(text: "被鱼刺卡住了应该猛吃食物,迅速咽下去", answer: false))
        questionArray.append(Question.init(text: "红眼病人可以与他人共用生活和学习用品", answer: false))
        questionArray.append(Question.init(text: "身上着火后,应迅速用灭火器灭火", answer: false))
        questionArray.append(Question.init(text: "创伤伤口内有玻璃碎片等大块异物是,到医院救治前,可以自行取出", answer: false))
        questionArray.append(Question.init(text: "发生煤气中毒时,应首先将门,窗打开通风换气", answer: true))
        questionArray.append(Question.init(text: "进行人工呼吸前,应先清除患者口腔内的痰,血块和其他杂物等,以保证呼吸道畅通", answer: true))
    }
    
}

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, answer: Bool) {
        self.questionText = text
        self.answer = answer
    }
}
