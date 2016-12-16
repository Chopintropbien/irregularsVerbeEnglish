//
//  ChooseVerbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 26/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import UIKit



class ChooseVerbes: UIViewController, ENSideMenuDelegate {
    
    var level: Level!
    

    @IBOutlet weak var randomOrderButton: UIButton!
    
    @IBOutlet weak var randomOrderLabel: UILabel!
    @IBOutlet weak var formOrderLabel: UILabel!
    @IBOutlet weak var alphabeticOrderLabel: UILabel!
    
    
    @IBOutlet weak var AAAButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var ABAButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var ABBButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var ABAnButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var ABBnButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var ABCButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var iauButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var enUsButton: CategoryVerbeButtonWhite!
    
    
    @IBOutlet weak var ABButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var CDButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var EFButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var GHIButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var JKLButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var MButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var OButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var PQButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var RButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var S1Button: CategoryVerbeButtonWhite!
    @IBOutlet weak var S2Button: CategoryVerbeButtonWhite!
    @IBOutlet weak var TButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var UButton: CategoryVerbeButtonWhite!
    @IBOutlet weak var WButton: CategoryVerbeButtonWhite!
    


    @IBAction func getViewVerbes(_ sender: UIButton){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set text in the choosed language
        self.title = Localization("Irregular verbs")
        self.randomOrderButton.setTitle(Localization("Random"), for: UIControlState())
        self.randomOrderLabel.text = Localization("Random order")
        self.formOrderLabel.text = Localization("Classified by form")
        self.alphabeticOrderLabel.text = Localization("Classified by alphabetical order")
        
        
        
        //        let screenHeight = self.view.bounds.height
        let screenWidth = self.view.bounds.width
        
        // 1th label
        let labelHeight = height(65)
        let randomOrderLabelMarginTop = height(190)
        randomOrderLabel.frame = CGRect(x: 0, y: randomOrderLabelMarginTop, width: screenWidth, height: labelHeight)
        
        // Random Button
        let buttonHeight = height(75)
        let randomOrderButtonMarginTop = height(20)
        let randomOrderButtonY = randomOrderLabelMarginTop + randomOrderButtonMarginTop + labelHeight
        
        let randomOrderButtonWidth = width(365)
        let randomOrderButtonX = (screenWidth - randomOrderButtonWidth)*0.5
        let randomOrderButtonHeight = buttonHeight + height(25)
        randomOrderButton.frame = CGRect(x: randomOrderButtonX, y: randomOrderButtonY, width: randomOrderButtonWidth, height: randomOrderButtonHeight)
        randomOrderButton.backgroundColor = pink
        randomOrderButton.setTitleColor(UIColor.white, for: UIControlState())
        
        // 2th label
        let formOrderLabelMarginTop = height(45)
        let formOrderLabelY = randomOrderButtonY + randomOrderButtonHeight + formOrderLabelMarginTop
        formOrderLabel.frame = CGRect(x: 0, y: formOrderLabelY, width: screenWidth, height: labelHeight)
        
        
        // All the form button
        let row1MarginTop = height(25)
        let marginBottomBetweenTwo = height(20)
        
        let formWidth = width(203)
        let formMarginToBorder = width(43)
        let formMarginRightBetweenTwo = (screenWidth - formWidth*3 - formMarginToBorder*2) * 0.5
        
        
        let row1FormY = formOrderLabelY + labelHeight + row1MarginTop
        let row2FormY = row1FormY + buttonHeight + marginBottomBetweenTwo
        let row3FormY = row2FormY + buttonHeight + marginBottomBetweenTwo
        
        let column1FormY = formMarginToBorder
        let column2FormY = column1FormY + formWidth + formMarginRightBetweenTwo
        let column3FormY = column2FormY + formWidth + formMarginRightBetweenTwo
        
        
        AAAButton.frame = CGRect(x: column1FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        ABBButton.frame = CGRect(x: column2FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        ABAButton.frame = CGRect(x: column3FormY, y: row1FormY, width: formWidth, height: buttonHeight)
        
        
        ABAnButton.frame = CGRect(x: column1FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        ABBnButton.frame = CGRect(x: column2FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        ABCButton.frame = CGRect(x: column3FormY, y: row2FormY, width: formWidth, height: buttonHeight)
        
        
        enUsButton.frame = CGRect(x: column1FormY + width(116), y: row3FormY, width: formWidth, height: buttonHeight)
        iauButton.frame = CGRect(x: column2FormY + width(116), y: row3FormY, width: formWidth, height: buttonHeight)
        
        
        
        
        
        
        // 3th label
        let alphabeticOrderLabelLabelY = row3FormY + buttonHeight + formOrderLabelMarginTop
        alphabeticOrderLabel.frame = CGRect(x: 0, y: alphabeticOrderLabelLabelY, width: screenWidth, height: labelHeight)
        
        
        // All the letter button
        let letterWidth = width(165)
        let letterMarginToBorder = width(25)
        let letterMarginRightBetweenTwo = (screenWidth - letterWidth*4 - letterMarginToBorder*2)/3.0
        
        
        let row1LetterY = alphabeticOrderLabelLabelY + labelHeight + row1MarginTop
        let row2LetterY = row1LetterY + buttonHeight + marginBottomBetweenTwo
        let row3LetterY = row2LetterY + buttonHeight + marginBottomBetweenTwo
        let row4LetterY = row3LetterY + buttonHeight + marginBottomBetweenTwo
        
        
        let column1LetterY = letterMarginToBorder
        let column2LetterY = column1LetterY + letterWidth + letterMarginRightBetweenTwo
        let column3LetterY = column2LetterY + letterWidth + letterMarginRightBetweenTwo
        let column4LetterY = column3LetterY + letterWidth + letterMarginRightBetweenTwo
        
        
        ABButton.frame = CGRect(x: column1LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        CDButton.frame = CGRect(x: column2LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        EFButton.frame = CGRect(x: column3LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        GHIButton.frame = CGRect(x: column4LetterY, y: row1LetterY, width: letterWidth, height: buttonHeight)
        
        
        
        let letterbigMarginToBorder = width(90)
        // do not display Button O
        if(level == Level.A2){
            OButton.isHidden = true
            
            JKLButton.frame = CGRect(x: column1LetterY + letterbigMarginToBorder, y: row2LetterY, width: letterWidth, height: buttonHeight)
            MButton.frame = CGRect(x: column2LetterY + letterbigMarginToBorder, y: row2LetterY, width: letterWidth, height: buttonHeight)
            PQButton.frame = CGRect(x: column3LetterY + letterbigMarginToBorder, y: row2LetterY, width: letterWidth, height: buttonHeight)
        }
        else{
            JKLButton.frame = CGRect(x: column1LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
            MButton.frame = CGRect(x: column2LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
            OButton.frame = CGRect(x: column3LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
            PQButton.frame = CGRect(x: column4LetterY, y: row2LetterY, width: letterWidth, height: buttonHeight)
        }
        
        
        RButton.frame = CGRect(x: column1LetterY + letterbigMarginToBorder, y: row3LetterY, width: letterWidth, height: buttonHeight)
        S1Button.frame = CGRect(x: column2LetterY + letterbigMarginToBorder, y: row3LetterY, width: letterWidth, height: buttonHeight)
        S2Button.frame = CGRect(x: column3LetterY + letterbigMarginToBorder, y: row3LetterY, width: letterWidth, height: buttonHeight)
        
        TButton.frame = CGRect(x: column1LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        UButton.frame = CGRect(x: column2LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        WButton.frame = CGRect(x: column3LetterY + letterbigMarginToBorder, y: row4LetterY, width: letterWidth, height: buttonHeight)
        
        
    }

    
    
    
    fileprivate let verbesData = Verbes()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rev = segue.destination as? RevisionVerbes{
            
            let nbVerbeRandom = 15
            let headerTextRandom: String = Localization("Try to remember this ") + String(nbVerbeRandom) + Localization(" verbes")
            rev.level = level
            
            
            func setTextInStringType(_ form: Form){
                switch form {
                case Form.AAA:
                    rev.headerText = Localization("These are irregular verbs  with no changes: A-A–A")
                case Form.ABB:
                    rev.headerText = Localization("These are irregular verbs with the same Past and Past Participle tense: A-B-B")
                case Form.ABA:
                    rev.headerText = Localization("These are irregular verbs with the same Present and Past Participle tense: A-B-A")
                case Form.ABAn:
                    rev.headerText = Localization("Here are irregular verbs where the Past Participle is the same as the Present but with an ”n” or ”en” at the end: A-B-An")
                case Form.ABBn:
                    rev.headerText = Localization("Here are irregular verbs where the Past Participle is the same as the Preterit but with an ”n” or ”en” at the end: A-B-Bn")
                case Form.iau:
                    rev.headerText = Localization("These are irregular verbs with “i” for the Present, ”a” for the Preterit and “u” for the Past Participle: i-a-u")
                case Form.ABC:
                    rev.headerText = Localization("These are irregular verbs which are different from each other: A-B-C")
                case Form.enUs:
                    rev.headerText = Localization("These are irregular verbs with different spellings in British and American English: eu/us")
                }
                
                // set form
                rev.form = form
                setStaticButton()
            }
            
            func setTextInLetterType(_ letter: LetterButton){
                rev.headerText = Localization("Here are irregular verbs who begins by: ") + letter.rawValue.uppercased()
                
                // set letter
                rev.letter = letter
                setStaticButton()
            }
            
            func setTextRandom(){
                rev.headerText = headerTextRandom
                setStaticButton()
            }

            func setStaticButton(){
                // set random button
                rev.nextButtonText = Localization("Next")
                if(rev.verbes.count == 1){ // if just one verbes, don't dysplay the next button
                    rev.nextButtonHidden = true
                }
                
            }
            
            
            
            //             print all the verbes
            
//            func foldl(_ list:Array<String>, base:String) -> String {
//                
//                var result = base
//                
//                for item in list {
//                    
//                    result = result + item
//                    
//                }
//                
//                return result
//                
//            }
            
            
            
//            verbesData.printVerbes()
            
//            verbesData.witchCategoriesAreNotAvalable()
            
//            verbesData.testAllAudio()
            
            
                
//            print(verbesData.verbes.count)
            
//            print(foldl(verbesData.verbes.map({
//                
//                let form = $0.form
//                
//                var formS = ""
//                switch(form){
//                case Form.aiea:
//                    formS = "aiea"
//                case Form.aua:
//                    formS = "aua"
//                case Form.eae:
//                    formS = "eae"
//                case Form.eao:
//                    formS = "eao"
//                case Form.eiieie:
//                    formS = "eiieie"
//                case Form.eiii:
//                    formS = "eiii"
//                case Form.iao:
//                    formS = "iao"
//                case Form.iau:
//                    formS = "iau"
//                case Form.ieoo:
//                    formS = "ieoo"
//                case Form.undefine:
//                    formS = "undefine"
//                case Form.weak:
//                    formS = "weak"
//                }
//   
//                let a = $0.level.rawValue
//                    + "," + formS
//                    + "," + $0.infinitf()
//                    + ",er " + $0.present()
//                    + ",er " + $0.preterit()
//                let b = ",er " + $0.parfait()
//                    + ","+$0.translation(Lang.fr)
//                    + "," + $0.translation(Lang.en)
//                    + "," + $0.translation(Lang.es)
//                    + ","+$0.translation(Lang.ru) + ",\n"
//                return a + b
//            }), base: ""))
 
 
            
            // TODO:: Mieux faire les choses
            
            // sort verbes by letter and by level
            func filterVerbeByLetter(_ letter: LetterButton) -> [Verbe]{
                return verbesData.filterBy(letter, level: level)
            }
            // sort verbes by form and by level
            func filterVerbeByForm(_ form: Form) -> [Verbe]{
                return verbesData.filterBy(form, level: level)
            }
            
            if let id = segue.identifier{
                switch id {
                case LetterButton.AB.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.AB)
                    setTextInLetterType(LetterButton.AB)
                case LetterButton.CD.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.CD)
                    setTextInLetterType(LetterButton.CD)
                case LetterButton.EF.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.EF)
                    setTextInLetterType(LetterButton.EF)
                case LetterButton.GHI.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.GHI)
                    setTextInLetterType(LetterButton.GHI)
                case LetterButton.JKL.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.JKL)
                    setTextInLetterType(LetterButton.JKL)
                case LetterButton.M.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.M)
                    setTextInLetterType(LetterButton.M)
                case LetterButton.O.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.O)
                    setTextInLetterType(LetterButton.O)
                case LetterButton.PQ.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.PQ)
                    setTextInLetterType(LetterButton.PQ)
                case LetterButton.R.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.R)
                    setTextInLetterType(LetterButton.R)
                case LetterButton.S1.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.S1)
                    setTextInLetterType(LetterButton.S1)
                case LetterButton.S2.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.S2)
                    setTextInLetterType(LetterButton.S2)
                case LetterButton.T.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.T)
                    setTextInLetterType(LetterButton.T)
                case LetterButton.U.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.U)
                    setTextInLetterType(LetterButton.U)
                case LetterButton.W.rawValue:
                    rev.verbes = filterVerbeByLetter(LetterButton.W)
                    setTextInLetterType(LetterButton.W)
                    
                    
                case Form.AAA.rawValue:
                    rev.verbes = filterVerbeByForm(Form.AAA)
                    setTextInStringType(Form.AAA)
                case Form.ABB.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ABB)
                    setTextInStringType(Form.ABB)
                case Form.ABA.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ABA)
                    setTextInStringType(Form.ABA)
                case Form.ABBn.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ABBn)
                    setTextInStringType(Form.ABBn)
                case Form.ABAn.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ABAn)
                    setTextInStringType(Form.ABAn)
                case Form.ABC.rawValue:
                    rev.verbes = filterVerbeByForm(Form.ABC)
                    setTextInStringType(Form.ABC)
                case Form.iau.rawValue:
                    rev.verbes = filterVerbeByForm(Form.iau)
                    setTextInStringType(Form.iau)
                case Form.enUs.rawValue:
                    rev.verbes = filterVerbeByForm(Form.enUs)
                    setTextInStringType(Form.enUs)
                    
                    
                case "random":
                    rev.verbes = []
                    for _ in 1...nbVerbeRandom{
                        let randomIndex = Int(arc4random_uniform(UInt32(verbesData.verbes.count)))
                        rev.verbes.append(verbesData.verbes[randomIndex])
                    }
                    setTextRandom()
                default:
                    rev.verbes = []
                }
            }

        }
    }
    
    
    
    
    

    
    // helper function for computer the proportions
    fileprivate func height(_ h: Double) -> CGFloat{
        let screenHeight = self.view.bounds.height
        let designHeight: CGFloat = 1334.0
        
        return screenHeight * (CGFloat(h)/designHeight)
    }
    fileprivate func width(_ w: Double) -> CGFloat{
        let screenWidth = self.view.bounds.width
        let designWidth: CGFloat = 750.0
        
        return screenWidth * (CGFloat(w)/designWidth)
    }


    
    

}

