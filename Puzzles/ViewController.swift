//
//  ViewController.swift
//  Puzzles
//
//  Created by 杜俊楠 on 2022/10/18.
//
let WIDTH = UIScreen.main.bounds.width
let HEIGHT = UIScreen.main.bounds.height


import UIKit


class ViewController: UIViewController {
    //model
    let questionBank = QuestionBank()
    var currentQstNum = 0
    var score: Int = 0 {
        willSet {
            self.scoreLab.text = "得分:\(newValue)"
        }
    }
    //view
    lazy var textLab = UILabel()
    lazy var btn_true = UIButton()
    lazy var btn_false = UIButton()
    lazy var scoreLab = UILabel()
    lazy var progressView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUI()
        setData()
        setAutoLayout()
    }

}

extension ViewController {
        
    func setUI() {
        self.textLab = {
            let lab = UILabel(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT/2))
            lab.textAlignment = .center
            lab.numberOfLines = 0
            lab.backgroundColor = .lightGray
            lab.textColor = .white
            return lab
        }()
        view.addSubview(textLab)
        
        self.btn_true = {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            btn.center = CGPoint(x: WIDTH/3, y: HEIGHT/2+150)
            btn.setTitle("是", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .gray
            btn.layer.cornerRadius = 3
            btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            btn.tag = 125
            return btn
        }()
        view.addSubview(btn_true)
        
        self.btn_false = {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
            btn.center = CGPoint(x: WIDTH/3*2, y: HEIGHT/2+150)
            btn.setTitle("否", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .gray
            btn.layer.cornerRadius = 3
            btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            btn.tag = 126
            return btn
        }()
        view.addSubview(btn_false)
        
        self.scoreLab = {
            let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            lab.center = CGPoint(x: 230, y: 500)
            lab.textAlignment = .right
            lab.text = "分数:0"
            return lab
        }()
        view.addSubview(scoreLab)
        
        self.progressView = {
            let view = UIView(frame: CGRect(x: 0, y: 750, width: WIDTH, height: 10))
            view.backgroundColor = UIColor.green
            view.frame.size.width = 0
            return view
        }()
        view.addSubview(progressView)
        
    }
    
    func setData() {
        showQuestion()
    }
    
    func setAutoLayout() {
        self.scoreLab.mas_makeConstraints { make in
            make?.right.equalTo()(self.view.mas_right)?.offset()(-10)
            make?.height.equalTo()(40)
            make?.width.equalTo()(200)
            make?.top.equalTo()(self.textLab.mas_bottom)?.offset()(20)
        }
    }
}



extension ViewController {
    
    @objc func btnAction(_ sender: UIButton) {
        switch sender.tag {
        case 125:
//            print("选择了对")
            answerIsRight(true)
        case 126:
//            print("选择了错")
            answerIsRight(false)
        default:
            return
        }
    }
    
    func answerIsRight(_ choose:Bool) {
        if (currentQstNum == (questionBank.questionArray.count-1)) {
            //答完了
            let alert = UIAlertController.init(title: "您完成了所有的题目", message: "要再来一遍么?", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "再来一遍", style: .cancel, handler: { _ in
                self.currentQstNum = 0
                self.score = 0
                self.showQuestion()
                self.fixProgressView()
            }))
            self.present(alert, animated: true)
            return
        }
        
        let standAnswer = questionBank.questionArray[currentQstNum].answer
        var isRight: String = ""
        if choose == standAnswer {
            //对了
            score += 20
            isRight = "你答对了"
        }
        else {
            //错了
            isRight = "你答错了"
        }
        let alert = UIAlertController.init(title: isRight, message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction.init(title: "下一题", style: .cancel))
        self.present(alert, animated: true) {
            alert.dismiss(animated: true)
        }
        
        currentQstNum+=1
        fixProgressView()
        showQuestion()
    }
    
    func showQuestion() {
        let firstQuestion = questionBank.questionArray[currentQstNum]
        self.textLab.text = firstQuestion.questionText
    }
    
    func fixProgressView() {
        let allLength = questionBank.questionArray.count
        let current = currentQstNum+1
        let width = Int(WIDTH)*current/allLength
        progressView.frame.size.width = CGFloat(width)
    }
}
