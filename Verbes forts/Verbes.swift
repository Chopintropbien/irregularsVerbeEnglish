//
//  Verbes.swift
//  Verbes forts
//
//  Created by Lauriane Mollier on 29/08/2016.
//  Copyright © 2016 Lauriane Mollier. All rights reserved.
//

import Foundation

enum Form: String { // 8
    case AAA = "A-A-A"
    case ABB = "A-B-B"
    case ABA = "A-B-A"
    case ABBn = "A-B-Bn"
    case ABAn = "A-B-An"
    case ABC = "A-B-C"
    case iau = "i-a-u"
    case enUs = "en-us"
    
    static let allValues = [AAA, ABB, ABA, ABC, ABBn, ABAn , iau, enUs]
}

// c'est pas beau du tout, mais d'un coté ils n'accepte pas
enum LetterButton: String{
    case AB = "a-b"
    case CD = "c-d"
    case EF = "e-f"
    case GHI = "g-h-i"
    case JKL = "j-k-l"
    case M = "m"
    case O = "o"
    case PQ = "p-q"
    case R = "r"
    case S1 = "sa-se-sh-si-sl-sm"
    case S2 = "sn-so-sp-st-sw"
    case T = "t"
    case U = "u"
    case W = "w"
    
    
    static let allValues = [AB, CD, EF, GHI, JKL, M, O, PQ, R, S1, S2, T, U, W]
}

enum Level: String{
    case A2 = "A2"
    case B1 = "B1"
    case B2 = "B2"
    case C1 = "C1"
    case All = "All"
    
    static let allValues = [A2, B1, B2, C1, All]
}


class Verbe{
    let level: Level
    let form: Form
    let verbe: (String, String, String)
    fileprivate let translations = [Lang:String]() // TODO: Qu'il soit immutable: Constutor builder
    
    
    /// :param: verbe infinitf-preterit-parfait
    /// :param: translations The transate in each avalable language
    init(level: Level, form: Form, verbe: (String, String, String), translations: [(Lang, String)]){
        self.level = level
        self.form = form
        self.verbe = verbe
        
        translations.forEach({
            self.translations[$0] = $1
        })
    }
    
    func infinitf() -> String {
        let v = verbe.0.components(separatedBy: ")-");
        if(v.count == 2){
            return v[1]
        }
        else {
            return v[0]
        }
    }
    func preterit() -> String {return verbe.1}
    func parfait() -> String {return verbe.2}
    
    func translation(_ lang: Lang) -> String {return translations[lang]!}
}


struct Verbes{
    
    internal let verbes : [Verbe] =
        [
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("arise", "arose", "arisen"), translations: [(Lang.fr, "survenir"), (Lang.en, "arise"), (Lang.es, "surgir")]),
            Verbe(level: Level.A2, form: Form.ABBn, verbe: ("awake", "awoke", "awoken"), translations: [(Lang.fr, "se réveiller"), (Lang.en, "awake"), (Lang.es, "despertar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("backslide", "backslid", "backslidden/backslid"), translations: [(Lang.fr, "récidiver"), (Lang.en, "backslide"), (Lang.es, "recaer/reincidir")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("be", "was", "were"), translations: [(Lang.fr, "been"), (Lang.en, "be"), (Lang.es, "être")]),
            Verbe(level: Level.B1, form: Form.enUs, verbe: ("bear", "bore", "borne/born"), translations: [(Lang.fr, "porter/supporter/naître"), (Lang.en, "bear"), (Lang.es, "parir/cargar/soportar")]),
            Verbe(level: Level.B1, form: Form.ABC, verbe: ("beat", "beat", "beaten"), translations: [(Lang.fr, "battre"), (Lang.en, "beat"), (Lang.es, "golpear/vencer")]),
            Verbe(level: Level.A2, form: Form.ABA, verbe: ("become", "became", "become"), translations: [(Lang.fr, "devenir"), (Lang.en, "become"), (Lang.es, "convertirse")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("begin", "began", "begun"), translations: [(Lang.fr, "commencer"), (Lang.en, "begin"), (Lang.es, "comenzar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("bend", "bent", "bent"), translations: [(Lang.fr, "plier/se courber"), (Lang.en, "bend"), (Lang.es, "inclinarse/doblar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("bet", "bet", "bet"), translations: [(Lang.fr, "parier"), (Lang.en, "bet"), (Lang.es, "apostar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("(farewell)-bid", "bid/bade", "bidden"), translations: [(Lang.fr, "dire adieu"), (Lang.en, "(farewell)-bid"), (Lang.es, "despedirse")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("(offer amount)-bid", "bid", "bid"), translations: [(Lang.fr, "faire une offre"), (Lang.en, "(offer amount)-bid"), (Lang.es, "ofertar/pujar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("bind", "bound", "bound"), translations: [(Lang.fr, "relier/lier"), (Lang.en, "bind"), (Lang.es, "atar")]),
            Verbe(level: Level.B1, form: Form.ABC, verbe: ("bite", "bit", "bitten"), translations: [(Lang.fr, "mordre"), (Lang.en, "bite"), (Lang.es, "morder")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("bleed", "bled", "bled"), translations: [(Lang.fr, "saigner"), (Lang.en, "bleed"), (Lang.es, "sangrar")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("blow", "blew", "blown"), translations: [(Lang.fr, "souffler/gonfler"), (Lang.en, "blow"), (Lang.es, "soplar")]),
            Verbe(level: Level.A2, form: Form.ABBn, verbe: ("break", "broke", "broken"), translations: [(Lang.fr, "casser"), (Lang.en, "break"), (Lang.es, "romper")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("breed", "bred", "bred"), translations: [(Lang.fr, "élever (des animaux)"), (Lang.en, "breed"), (Lang.es, "criar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("bring", "brought", "brought"), translations: [(Lang.fr, "apporter"), (Lang.en, "bring"), (Lang.es, "llevar")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("broadcast", "broadcast", "broadcast"), translations: [(Lang.fr, "diffuser/émettre"), (Lang.en, "broadcast"), (Lang.es, "transmitir")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("browbeat", "browbeat", "browbeaten/browbeat"), translations: [(Lang.fr, "intimider"), (Lang.en, "browbeat"), (Lang.es, "intimidar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("build", "built", "built"), translations: [(Lang.fr, "construire"), (Lang.en, "build"), (Lang.es, "construir")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("burn", "burnt/burned", "burnt/burned"), translations: [(Lang.fr, "brûler"), (Lang.en, "burn"), (Lang.es, "quemar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("burst", "burst", "burst"), translations: [(Lang.fr, "éclater"), (Lang.en, "burst"), (Lang.es, "explotar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("bust", "busted/bust", "busted/bust"), translations: [(Lang.fr, "arrêter/choper/échouer"), (Lang.en, "bust"), (Lang.es, "quebrar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("buy", "bought", "bought"), translations: [(Lang.fr, "acheter"), (Lang.en, "buy"), (Lang.es, "comprar")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("broadcast", "broadcast", "broadcast"), translations: [(Lang.fr, "diffuser/émettre"), (Lang.en, "broadcast"), (Lang.es, "transmitir")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("catch", "caught", "caught"), translations: [(Lang.fr, "attraper"), (Lang.en, "catch"), (Lang.es, "atrapar")]),
            Verbe(level: Level.A2, form: Form.ABBn, verbe: ("choose", "chose", "chosen"), translations: [(Lang.fr, "choisir"), (Lang.en, "choose"), (Lang.es, "elegir")]),
            Verbe(level: Level.B2, form: Form.ABC, verbe: ("cling", "clung", "clung"), translations: [(Lang.fr, "s'accrocher"), (Lang.en, "cling"), (Lang.es, "aferrarse/agarrarse")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("clothe", "clad/clothed", "clad/clothed"), translations: [(Lang.fr, "habiller/recouvrir"), (Lang.en, "clothe"), (Lang.es, "vestir")]),
            Verbe(level: Level.A2, form: Form.ABA, verbe: ("come", "came", "come"), translations: [(Lang.fr, "venir"), (Lang.en, "come"), (Lang.es, "venir/llegar")]),
            Verbe(level: Level.A2, form: Form.AAA, verbe: ("cost", "cost", "cost"), translations: [(Lang.fr, "coûter"), (Lang.en, "cost"), (Lang.es, "costar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("creep", "crept", "crept"), translations: [(Lang.fr, "ramper"), (Lang.en, "creep"), (Lang.es, "trepar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("crossbreed", "crossbred", "crossbred"), translations: [(Lang.fr, "croiser/métisser"), (Lang.en, "crossbreed"), (Lang.es, "cruzar")]),
            Verbe(level: Level.A2, form: Form.AAA, verbe: ("cut", "cut", "cut"), translations: [(Lang.fr, "couper"), (Lang.en, "cut"), (Lang.es, "cortar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("daydream", "daydreamed/daydreamt", "daydreamed/daydreamt"), translations: [(Lang.fr, "rêvasser"), (Lang.en, "daydream"), (Lang.es, "fantasear")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("deal", "dealt", "dealt"), translations: [(Lang.fr, "distribuer"), (Lang.en, "deal"), (Lang.es, "comerciar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("dig", "dug", "dug"), translations: [(Lang.fr, "creuser"), (Lang.en, "dig"), (Lang.es, "cavar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("disprove", "disproved", "disproved/disproven"), translations: [(Lang.fr, "réfuter"), (Lang.en, "disprove"), (Lang.es, "desmentir")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("(jump head-first)-dive", "dove/dived", "dived"), translations: [(Lang.fr, "se jeter la tête la première"), (Lang.en, "(jump head-first)-dive"), (Lang.es, "zambullirse")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("(scuba diving)-dive", "dived/dove", "dived"), translations: [(Lang.fr, "plonger"), (Lang.en, "(scuba diving)-dive"), (Lang.es, "bucear")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("do", "did", "done"), translations: [(Lang.fr, "faire"), (Lang.en, "do"), (Lang.es, "hacer")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("draw", "drew", "drawn"), translations: [(Lang.fr, "dessiner/tirer"), (Lang.en, "draw"), (Lang.es, "dibujar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("dream", "dreamt/dreamed", "dreamt/dreamed"), translations: [(Lang.fr, "rêver"), (Lang.en, "dream"), (Lang.es, "soñar")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("drink", "drank", "drunk"), translations: [(Lang.fr, "boire"), (Lang.en, "drink"), (Lang.es, "beber")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("drive", "drove", "driven"), translations: [(Lang.fr, "conduire"), (Lang.en, "drive"), (Lang.es, "conducir")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("dwell", "dwelt", "dwelt/dwelled"), translations: [(Lang.fr, "habiter"), (Lang.en, "dwell"), (Lang.es, "residir")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("eat", "ate", "eaten"), translations: [(Lang.fr, "manger"), (Lang.en, "eat"), (Lang.es, "comer")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("fall", "fell", "fallen"), translations: [(Lang.fr, "tomber"), (Lang.en, "fall"), (Lang.es, "caer(se)")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("feed", "fed", "fed"), translations: [(Lang.fr, "nourrir"), (Lang.en, "feed"), (Lang.es, "alimentar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("feel", "felt", "felt"), translations: [(Lang.fr, "se sentir/ressentir"), (Lang.en, "feel"), (Lang.es, "sentir")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("fight", "fought", "fought"), translations: [(Lang.fr, "se battre"), (Lang.en, "fight"), (Lang.es, "luchar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("find", "found", "found"), translations: [(Lang.fr, "trouver"), (Lang.en, "find"), (Lang.es, "encontrar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("(tailor change size)-fit", "fitted/fit", "fitted/fit"), translations: [(Lang.fr, "adapter/accorder"), (Lang.en, "(tailor change size)-fit"), (Lang.es, "quedar bien")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("(be right size)-fit", "fit/fitted", "fit/fitted"), translations: [(Lang.fr, "convenir"), (Lang.en, "(be right size)-fit"), (Lang.es, "valer")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("flee", "fled", "fled"), translations: [(Lang.fr, "s'enfuir"), (Lang.en, "flee"), (Lang.es, "huir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("fling", "flung", "flung"), translations: [(Lang.fr, "lancer"), (Lang.en, "fling"), (Lang.es, "lanzar")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("fly", "flew", "flown"), translations: [(Lang.fr, "voler"), (Lang.en, "fly"), (Lang.es, "volar")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("forbid", "forbade", "forbidden"), translations: [(Lang.fr, "interdire"), (Lang.en, "forbid"), (Lang.es, "prohibir")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("forecast", "forecast", "forecast"), translations: [(Lang.fr, "prévoir"), (Lang.en, "forecast"), (Lang.es, "predecir")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("forego", "forewent", "foregone"), translations: [(Lang.fr, "renoncer/se priver de"), (Lang.en, "forego"), (Lang.es, "preceder")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("foresee", "foresaw", "foreseen"), translations: [(Lang.fr, "prévoir/presentir"), (Lang.en, "foresee"), (Lang.es, "prever")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("foretell", "foretold", "foretold"), translations: [(Lang.fr, "prévoir/prédire/présager"), (Lang.en, "foretell"), (Lang.es, "predecir")]),
            Verbe(level: Level.A2, form: Form.enUs, verbe: ("forget", "forgot", "forgotten/forgot"), translations: [(Lang.fr, "oublier"), (Lang.en, "forget"), (Lang.es, "olvidar")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("forgive", "forgave", "forgiven"), translations: [(Lang.fr, "pardonner"), (Lang.en, "forgive"), (Lang.es, "perdonar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("forsake", "forsook", "forsaken"), translations: [(Lang.fr, "abandonner"), (Lang.en, "forsake"), (Lang.es, "abandonar")]),
            Verbe(level: Level.B1, form: Form.ABBn, verbe: ("freeze", "froze", "frozen"), translations: [(Lang.fr, "geler"), (Lang.en, "freeze"), (Lang.es, "congelar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("frostbite", "frostbit", "frostbitten"), translations: [(Lang.fr, "geler"), (Lang.en, "frostbite"), (Lang.es, "congelar")]),
            Verbe(level: Level.A2, form: Form.enUs, verbe: ("get", "got", "gotten/got"), translations: [(Lang.fr, "obtenir"), (Lang.en, "get"), (Lang.es, "obtener")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("give", "gave", "given"), translations: [(Lang.fr, "donner"), (Lang.en, "give"), (Lang.es, "dar")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("go", "went", "gone"), translations: [(Lang.fr, "aller"), (Lang.en, "go"), (Lang.es, "ir")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("grind", "ground", "ground"), translations: [(Lang.fr, "moudre/opprimer"), (Lang.en, "grind"), (Lang.es, "moler")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("grow", "grew", "grown"), translations: [(Lang.fr, "grandir/pousser"), (Lang.en, "grow"), (Lang.es, "crecer")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("hand-feed", "hand-fed", "hand-fed"), translations: [(Lang.fr, "nourrir à la main"), (Lang.en, "hand-feed"), (Lang.es, "alimentar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("handwrite", "handwrote", "handwritten"), translations: [(Lang.fr, "écrire à la main"), (Lang.en, "handwrite"), (Lang.es, "escribir a mano")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("hang", "hung", "hung"), translations: [(Lang.fr, "tenir/pendre"), (Lang.en, "hang"), (Lang.es, "colgar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("have", "had", "had"), translations: [(Lang.fr, "avoir"), (Lang.en, "have"), (Lang.es, "tener")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("hear", "heard", "heard"), translations: [(Lang.fr, "entendre"), (Lang.en, "hear"), (Lang.es, "escuchar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("hew", "hewed", "hewn/hewed"), translations: [(Lang.fr, "tailler/couper"), (Lang.en, "hew"), (Lang.es, "tallar")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("hide", "hid", "hidden"), translations: [(Lang.fr, "cacher"), (Lang.en, "hide"), (Lang.es, "esconder")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("hit", "hit", "hit"), translations: [(Lang.fr, "taper/appuyer"), (Lang.en, "hit"), (Lang.es, "pegar/chocar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("hold", "held", "held"), translations: [(Lang.fr, "tenir"), (Lang.en, "hold"), (Lang.es, "agarrar")]),
            Verbe(level: Level.A2, form: Form.AAA, verbe: ("hurt", "hurt", "hurt"), translations: [(Lang.fr, "blesser"), (Lang.en, "hurt"), (Lang.es, "doler/lastimar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("inbreed", "inbred", "inbred"), translations: [(Lang.fr, "se marier (consanguin)"), (Lang.en, "inbreed"), (Lang.es, "reproducir(se)")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("inlay", "inlaid", "inlaid"), translations: [(Lang.fr, "incruster/marqueter"), (Lang.en, "inlay"), (Lang.es, "incrustar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("input", "input/inputted", "input/inputted"), translations: [(Lang.fr, "saisir/entrer"), (Lang.en, "input"), (Lang.es, "introducir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("interbreed", "interbred", "interbred"), translations: [(Lang.fr, "croiser (espèce)"), (Lang.en, "interbreed"), (Lang.es, "cruzar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("interweave", "interwove/interweaved", "interwoven/interweaved"), translations: [(Lang.fr, "entrelacer"), (Lang.en, "interweave"), (Lang.es, "entretejer")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("interwind", "interwound", "interwound"), translations: [(Lang.fr, "entremêler"), (Lang.en, "interwind"), (Lang.es, "entrelazar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("jerry-build", "jerry-built", "jerry-built"), translations: [(Lang.fr, "construire en carton pâte"), (Lang.en, "jerry-build"), (Lang.es, "chafallar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("keep", "kept", "kept"), translations: [(Lang.fr, "garder"), (Lang.en, "keep"), (Lang.es, "guardar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("kneel", "knelt/knelled", "knelt/kneeled"), translations: [(Lang.fr, "s'agenouiller"), (Lang.en, "kneel"), (Lang.es, "arrodillarse")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("knit", "knitted/knit", "knitted/knit"), translations: [(Lang.fr, "tricoter"), (Lang.en, "knit"), (Lang.es, "tejer")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("know", "knew", "known"), translations: [(Lang.fr, "connaître/savoir"), (Lang.en, "know"), (Lang.es, "saber")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("lay", "laid", "laid"), translations: [(Lang.fr, "poser"), (Lang.en, "lay"), (Lang.es, "poner/extender")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("lead", "led", "led"), translations: [(Lang.fr, "mener/guider"), (Lang.en, "lead"), (Lang.es, "guiar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("lean", "leant/leaned", "leant/leaned"), translations: [(Lang.fr, "s'incliner/se pencher"), (Lang.en, "lean"), (Lang.es, "apoyar(se)")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("leap", "leapt/leaped", "leapt/leaped"), translations: [(Lang.fr, "sauter/bondir"), (Lang.en, "leap"), (Lang.es, "saltar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("learn", "learnt", "learnt"), translations: [(Lang.fr, "apprendre"), (Lang.en, "learn"), (Lang.es, "aprender")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("leave", "left", "left"), translations: [(Lang.fr, "laisser/quitter/partir"), (Lang.en, "leave"), (Lang.es, "salir/partir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("lend", "lent", "lent"), translations: [(Lang.fr, "prêter"), (Lang.en, "lend"), (Lang.es, "prestar")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("let", "let", "let"), translations: [(Lang.fr, "permettre/louer"), (Lang.en, "let"), (Lang.es, "dejar/permitir")]),
            Verbe(level: Level.B1, form: Form.ABC, verbe: ("lie", "lay", "lain"), translations: [(Lang.fr, "s'allonger"), (Lang.en, "lie"), (Lang.es, "tenderse")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("light", "lit/lighted", "lit/lighted"), translations: [(Lang.fr, "allumer"), (Lang.en, "light"), (Lang.es, "iluminar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("lip-read", "lip-read", "lip-read"), translations: [(Lang.fr, "lire sur les lèvres"), (Lang.en, "lip-read"), (Lang.es, "leer los labios")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("lose", "lost", "lost"), translations: [(Lang.fr, "perdre"), (Lang.en, "lose"), (Lang.es, "perder")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("make", "made", "made"), translations: [(Lang.fr, "fabriquer"), (Lang.en, "make"), (Lang.es, "hacer")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("mean", "meant", "meant"), translations: [(Lang.fr, "signifier"), (Lang.en, "mean"), (Lang.es, "significar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("meet", "met", "met"), translations: [(Lang.fr, "rencontrer"), (Lang.en, "meet"), (Lang.es, "encontrarse/quedar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("miscast", "miscast", "miscast"), translations: [(Lang.fr, "faire une erreur de casting"), (Lang.en, "miscast"), (Lang.es, "dar un papel no adecuado")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("misdeal", "misdealt", "misdealt"), translations: [(Lang.fr, "faire un faux pas"), (Lang.en, "misdeal"), (Lang.es, "repartir mal")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("misdo", "misdid", "misdone"), translations: [(Lang.fr, "mal faire"), (Lang.en, "misdo"), (Lang.es, "hacer algo mal")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("mishear", "misheard", "misheard"), translations: [(Lang.fr, "mal entendre"), (Lang.en, "mishear"), (Lang.es, "escuchar/entender algo mal")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("mislay", "mislaid", "mislaid"), translations: [(Lang.fr, "égarer"), (Lang.en, "mislay"), (Lang.es, "extraviar algo temporalmente")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("mislead", "misled", "misled"), translations: [(Lang.fr, "induire en erreur"), (Lang.en, "mislead"), (Lang.es, "engañar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("mislearn", "mislearned/mislearnt", "mislearned/mislearnt"), translations: [(Lang.fr, "mal apprendre"), (Lang.en, "mislearn"), (Lang.es, "aprender mal")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("misread", "misread", "misread"), translations: [(Lang.fr, "mal lire"), (Lang.en, "misread"), (Lang.es, "leer incorrectamente")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("misset", "misset", "misset"), translations: [(Lang.fr, "ajuster incorrectement"), (Lang.en, "misset"), (Lang.es, "fijar mal/cuajar mal")]),
            Verbe(level: Level.B2, form: Form.ABBn, verbe: ("misspeak", "misspoke", "misspoken"), translations: [(Lang.fr, "mal parler"), (Lang.en, "misspeak"), (Lang.es, "hablar incorrectamente")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("misspell", "misspelled/misspelt", "misspelled/misspelt"), translations: [(Lang.fr, "mal orthographier"), (Lang.en, "misspell"), (Lang.es, "falta de ortografía")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("misspend", "misspent", "misspent"), translations: [(Lang.fr, "dépenser à tort et à travers"), (Lang.en, "misspend"), (Lang.es, "malgastar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("mistake", "mistook", "mistaken"), translations: [(Lang.fr, "faire erreur"), (Lang.en, "mistake"), (Lang.es, "equivocar(se)")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("misteach", "mistaught", "mistaught"), translations: [(Lang.fr, "mal enseigner"), (Lang.en, "misteach"), (Lang.es, "enseñar mal")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("misunderstand", "misunderstood", "misunderstood"), translations: [(Lang.fr, "mal comprendre"), (Lang.en, "misunderstand"), (Lang.es, "malinterpretar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("miswrite", "miswrote", "miswritten"), translations: [(Lang.fr, "mal écrire"), (Lang.en, "miswrite"), (Lang.es, "escribir mal")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("mow", "mowed", "mowed/mown"), translations: [(Lang.fr, "tondre"), (Lang.en, "mow"), (Lang.es, "cortar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("offset", "offset", "offset"), translations: [(Lang.fr, "compenser"), (Lang.en, "offset"), (Lang.es, "compensar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("outbid", "outbid", "outbid"), translations: [(Lang.fr, "surenchérir"), (Lang.en, "outbid"), (Lang.es, "pujar más que")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("outbreed", "outbred", "outbred"), translations: [(Lang.fr, "se reproduire"), (Lang.en, "outbreed"), (Lang.es, "cruzar")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outdo", "outdid", "outdone"), translations: [(Lang.fr, "surpasser"), (Lang.en, "outdo"), (Lang.es, "superar")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outdraw", "outdrew", "outdrawn"), translations: [(Lang.fr, "dégainer plus vite"), (Lang.en, "outdraw"), (Lang.es, "desenfundar antes que")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("outdrink", "outdrank", "outdrunk"), translations: [(Lang.fr, "boire plus"), (Lang.en, "outdrink"), (Lang.es, "beber más que alguien")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outdrive", "outdrove", "outdriven"), translations: [(Lang.fr, "dépasser"), (Lang.en, "outdrive"), (Lang.es, "sobreexplotar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("outfight", "outfought", "outfought"), translations: [(Lang.fr, "vaincre"), (Lang.en, "outfight"), (Lang.es, "vencer")]),
            Verbe(level: Level.C1, form: Form.ABC, verbe: ("outfly", "outflew", "outflown"), translations: [(Lang.fr, "voler plus loin"), (Lang.en, "outfly"), (Lang.es, "volar más que")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outgrow", "outgrew", "outgrown"), translations: [(Lang.fr, "devenir trop grand"), (Lang.en, "outgrow"), (Lang.es, "quedar pequeño")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outleap", "outleaped/outleapt", "outleaped/outleapt"), translations: [(Lang.fr, "sauter plus loin"), (Lang.en, "outleap"), (Lang.es, "sobresalir")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("(not tell truth)-outlie", "outlied", "outlied"), translations: [(Lang.fr, "trop mentir"), (Lang.en, "(not tell truth)-outlie"), (Lang.es, "requetementir")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("outride", "outrode", "outridden"), translations: [(Lang.fr, "résister"), (Lang.en, "outride"), (Lang.es, "ir más rápido que")]),
            Verbe(level: Level.B2, form: Form.ABA, verbe: ("outrun", "outran", "outrun"), translations: [(Lang.fr, "dépasser/distancer"), (Lang.en, "outrun"), (Lang.es, "correr más rápido que")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outsell", "outsold", "outsold"), translations: [(Lang.fr, "vendre davantage"), (Lang.en, "outsell"), (Lang.es, "venderse mejor")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outshine", "outshined/outshone", "outshined/outshone"), translations: [(Lang.fr, "surpasser en éclat"), (Lang.en, "outshine"), (Lang.es, "brillar más que")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outshoot", "outshot", "outshot"), translations: [(Lang.fr, "surpasser au tir"), (Lang.en, "outshoot"), (Lang.es, "tirar mejor que")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("outsing", "outsang", "outsung"), translations: [(Lang.fr, "surpasser au chant"), (Lang.en, "outsing"), (Lang.es, "cantar mejor que")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outsit", "outsat", "outsat"), translations: [(Lang.fr, "s’asseoir plus longtemps"), (Lang.en, "outsit"), (Lang.es, "sentarse más tiempo que")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("outsleep", "outslept", "outslept"), translations: [(Lang.fr, "dormir plus longtemps"), (Lang.en, "outsleep"), (Lang.es, "quedarse dormido")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outsmell", "outsmelled/outsmelt", "outsmelled/outsmelt"), translations: [(Lang.fr, "sentir plus fort que"), (Lang.en, "outsmell"), (Lang.es, "oler más que")]),
            Verbe(level: Level.C1, form: Form.ABBn, verbe: ("outspeak", "outspoke", "outspoken"), translations: [(Lang.fr, "signifier sa supériorité"), (Lang.en, "outspeak"), (Lang.es, "hablar más que")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outspeed", "outsped", "outsped"), translations: [(Lang.fr, "aller plus vite"), (Lang.en, "outspeed"), (Lang.es, "ser más rápido que")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("outspend", "outspent", "outspent"), translations: [(Lang.fr, "dépenser plus"), (Lang.en, "outspend"), (Lang.es, "gastar más que")]),
            Verbe(level: Level.C1, form: Form.ABBn, verbe: ("outswear", "outswore", "outsworn"), translations: [(Lang.fr, "jurer plus"), (Lang.en, "outswear"), (Lang.es, "prometer la luna")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("outswim", "outswam", "outswum"), translations: [(Lang.fr, "dépasser à la nage"), (Lang.en, "outswim"), (Lang.es, "nadar mejor que")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("outthink", "outthought", "outthought"), translations: [(Lang.fr, "déjouer"), (Lang.en, "outthink"), (Lang.es, "ser más listo que")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outthrow", "outthrew", "outthrown"), translations: [(Lang.fr, "jeter plus loin"), (Lang.en, "outthrow"), (Lang.es, "lanzar más lejos que")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("outwrite", "outwrote", "outwritten"), translations: [(Lang.fr, "surpasser en écriture"), (Lang.en, "outwrite"), (Lang.es, "escribir más o mejor que")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("overbid", "overbid", "overbid"), translations: [(Lang.fr, "enchérir plus que la valeur de l’objet"), (Lang.en, "overbid"), (Lang.es, "sobrepujar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overbreed", "overbred", "overbred"), translations: [(Lang.fr, "se reproduire trop"), (Lang.en, "overbreed"), (Lang.es, "cruzar de más")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overbuild", "overbuilt", "overbuilt"), translations: [(Lang.fr, "construire trop"), (Lang.en, "overbuild"), (Lang.es, "construir demasiado")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overbuy", "overbought", "overbought"), translations: [(Lang.fr, "acheter trop"), (Lang.en, "overbuy"), (Lang.es, "comprar en exceso")]),
            Verbe(level: Level.B1, form: Form.ABA, verbe: ("overcome", "overcame", "overcome"), translations: [(Lang.fr, "surmonter"), (Lang.en, "overcome"), (Lang.es, "vencer")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("overdo", "overdid", "overdone"), translations: [(Lang.fr, "en faire de trop"), (Lang.en, "overdo"), (Lang.es, "exagerar")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("overdraw", "overdrew", "overdrawn"), translations: [(Lang.fr, "retirer à découvert (argent)"), (Lang.en, "overdraw"), (Lang.es, "entrar en descubierto")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("overdrink", "overdrank", "overdrunk"), translations: [(Lang.fr, "boire trop"), (Lang.en, "overdrink"), (Lang.es, "beber demasiado")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("overeat", "overate", "overeaten"), translations: [(Lang.fr, "surchauffer"), (Lang.en, "overeat"), (Lang.es, "comer de más")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overfeed", "overfed", "overfed"), translations: [(Lang.fr, "trop nourrir"), (Lang.en, "overfeed"), (Lang.es, "sobrealimentar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overhang", "overhung", "overhung"), translations: [(Lang.fr, "surplomber"), (Lang.en, "overhang"), (Lang.es, "sobresalir")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overhear", "overheard", "overheard"), translations: [(Lang.fr, "entendre par hasard/surprendre"), (Lang.en, "overhear"), (Lang.es, "escuchar algo por casualidad")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overlay", "overlaid", "overlaid"), translations: [(Lang.fr, "recouvrir"), (Lang.en, "overlay"), (Lang.es, "cubrir")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overpay", "overpaid", "overpaid"), translations: [(Lang.fr, "surpayer"), (Lang.en, "overpay"), (Lang.es, "pagar de más")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("override", "overrode", "overridden"), translations: [(Lang.fr, "outrepasser/ignorer"), (Lang.en, "override"), (Lang.es, "ignorar")]),
            Verbe(level: Level.C1, form: Form.ABA, verbe: ("overrun", "overran", "overrun"), translations: [(Lang.fr, "envahir/infester"), (Lang.en, "overrun"), (Lang.es, "sobrepasar")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("oversee", "oversaw", "overseen"), translations: [(Lang.fr, "superviser"), (Lang.en, "oversee"), (Lang.es, "supervisar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("oversell", "oversold", "oversold"), translations: [(Lang.fr, "sur-vendre"), (Lang.en, "oversell"), (Lang.es, "alabar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("oversew", "oversewed", "oversewn/oversewed"), translations: [(Lang.fr, "coudre trop"), (Lang.en, "oversew"), (Lang.es, "sobrehilar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overshoot", "overshot", "overshot"), translations: [(Lang.fr, "dépasser/aller trop loin"), (Lang.en, "overshoot"), (Lang.es, "pasar de largo")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("oversleep", "overslept", "overslept"), translations: [(Lang.fr, "dormir trop"), (Lang.en, "oversleep"), (Lang.es, "quedarse dormido")]),
            Verbe(level: Level.B2, form: Form.ABBn, verbe: ("overspeak", "overspoke", "overspoken"), translations: [(Lang.fr, "exagérer"), (Lang.en, "overspeak"), (Lang.es, "exagerar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("overspend", "overspent", "overspent"), translations: [(Lang.fr, "dépenser trop"), (Lang.en, "overspend"), (Lang.es, "derrochar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overspill", "overspilled/overspilt", "overspilled/overspilt"), translations: [(Lang.fr, "excéder (un certain nombre)"), (Lang.en, "overspill"), (Lang.es, "sobrepoblar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("overtake", "overtook", "overtaken"), translations: [(Lang.fr, "dépasser/doubler"), (Lang.en, "overtake"), (Lang.es, "adelantar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("overthink", "overthought", "overthought"), translations: [(Lang.fr, "réfléchir trop"), (Lang.en, "overthink"), (Lang.es, "rumiar")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("overthrow", "overthrew", "overthrown"), translations: [(Lang.fr, "renverser (du pouvoir)"), (Lang.en, "overthrow"), (Lang.es, "derrocar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("overwind", "overwound", "overwound"), translations: [(Lang.fr, "trop tourner"), (Lang.en, "overwind"), (Lang.es, "dar demasiada cuerda a")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("overwrite", "overwrote", "overwritten"), translations: [(Lang.fr, "repasser sur"), (Lang.en, "overwrite"), (Lang.es, "sobreescribir")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("partake", "partook", "partaken"), translations: [(Lang.fr, "prendre part à"), (Lang.en, "partake"), (Lang.es, "participar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("pay", "paid", "paid"), translations: [(Lang.fr, "payer"), (Lang.en, "pay"), (Lang.es, "pagar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("plead", "pled/pleaded", "pled/pleaded"), translations: [(Lang.fr, "supplier/plaider"), (Lang.en, "plead"), (Lang.es, "suplicar/defender")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("prebuild", "prebuilt", "prebuilt"), translations: [(Lang.fr, "pré-construire"), (Lang.en, "prebuild"), (Lang.es, "preconstruir")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("predo", "predid", "predone"), translations: [(Lang.fr, "pré-faire"), (Lang.en, "predo"), (Lang.es, "anticipar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("premake", "premade", "premade"), translations: [(Lang.fr, "pré-fabriquer"), (Lang.en, "premake"), (Lang.es, "preparar algo por adelantado")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("prepay", "prepaid", "prepaid"), translations: [(Lang.fr, "prépayer"), (Lang.en, "prepay"), (Lang.es, "pagar por anticipado")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("presell", "presold", "presold"), translations: [(Lang.fr, "pré-vendre"), (Lang.en, "presell"), (Lang.es, "promocionar algo")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("preset", "preset", "preset"), translations: [(Lang.fr, "programmer"), (Lang.en, "preset"), (Lang.es, "programar")]),
            Verbe(level: Level.C1, form: Form.iau, verbe: ("preshrink", "preshrank", "preshrunk"), translations: [(Lang.fr, "pré-rétrécir"), (Lang.en, "preshrink"), (Lang.es, "preencoger")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("proofread", "proofread", "proofread"), translations: [(Lang.fr, "relire/corriger les épreuves"), (Lang.en, "proofread"), (Lang.es, "corregir/revisar")]),
            Verbe(level: Level.B1, form: Form.enUs, verbe: ("prove", "proved", "proven/proved"), translations: [(Lang.fr, "prouver"), (Lang.en, "prove"), (Lang.es, "probar")]),
            Verbe(level: Level.A2, form: Form.AAA, verbe: ("put", "put", "put"), translations: [(Lang.fr, "mettre"), (Lang.en, "put"), (Lang.es, "meter")]),
            Verbe(level: Level.B2, form: Form.ABBn, verbe: ("quick-freeze", "quick-froze", "quick-frozen"), translations: [(Lang.fr, "surgeler"), (Lang.en, "quick-freeze"), (Lang.es, "congelar rápidamente")]),
            Verbe(level: Level.A2, form: Form.AAA, verbe: ("quit", "quit", "quit"), translations: [(Lang.fr, "quitter"), (Lang.en, "quit"), (Lang.es, "renunciar")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("reawake", "reawoke", "reawaken"), translations: [(Lang.fr, "réveiller de nouveau"), (Lang.en, "reawake"), (Lang.es, "resucitar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("rebid", "rebid", "rebid"), translations: [(Lang.fr, "soumettre de nouveau"), (Lang.en, "rebid"), (Lang.es, "pujar de nuevo")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rebind", "rebound", "rebound"), translations: [(Lang.fr, "reconsolider"), (Lang.en, "rebind"), (Lang.es, "reatar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("rebroadcast", "rebroadcast/rebroadcasted", "rebroadcast/rebroadcasted"), translations: [(Lang.fr, "redifffuser"), (Lang.en, "rebroadcast"), (Lang.es, "retransmitir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rebuild", "rebuilt", "rebuilt"), translations: [(Lang.fr, "pré-construire"), (Lang.en, "rebuild"), (Lang.es, "preconstruir")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("recut", "recut", "recut"), translations: [(Lang.fr, "recouper"), (Lang.en, "recut"), (Lang.es, "recortar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("redeal", "redealt", "redealt"), translations: [(Lang.fr, "redistribue"), (Lang.en, "redeal"), (Lang.es, "volver a tratar/acordar")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("redo", "redid", "redone"), translations: [(Lang.fr, "pré-faire"), (Lang.en, "redo"), (Lang.es, "anticipar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("redraw", "redrew", "redrawn"), translations: [(Lang.fr, "redessiner"), (Lang.en, "redraw"), (Lang.es, "redibujar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("(replace parts)-refit", "refit/refitted", "refit/refitted"), translations: [(Lang.fr, "remettre en état"), (Lang.en, "(replace parts)-refit"), (Lang.es, "reemplazar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("(retailor)-refit", "refitted/refit", "refitted/refit"), translations: [(Lang.fr, "réparer"), (Lang.en, "(retailor)-refit"), (Lang.es, "reequipar/aprovisionar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("regrind", "reground", "reground"), translations: [(Lang.fr, "ré-affûter"), (Lang.en, "regrind"), (Lang.es, "remoler")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("regrow", "regrew", "regrown"), translations: [(Lang.fr, "(faire) pousser de nouveau"), (Lang.en, "regrow"), (Lang.es, "regenerarse")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rehang", "rehung", "rehung"), translations: [(Lang.fr, "rependre"), (Lang.en, "rehang"), (Lang.es, "colgar de nuevo")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rehear", "reheard", "reheard"), translations: [(Lang.fr, "réentendre"), (Lang.en, "rehear"), (Lang.es, "volver a oír")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("reknit", "reknitted/reknit", "reknitted/reknit"), translations: [(Lang.fr, "re-trictoter"), (Lang.en, "reknit"), (Lang.es, "volver a tejer")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("(for example tiles)-relay", "relaid", "relaid"), translations: [(Lang.fr, "reposer (des tuiles)"), (Lang.en, "(for example tiles)-relay"), (Lang.es, "recolocar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("(pass along)-relay", "relayed", "relayed"), translations: [(Lang.fr, "relayer"), (Lang.en, "(pass along)-relay"), (Lang.es, "pasar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("relearn", "relearned/relearnt", "relearned/relearnt"), translations: [(Lang.fr, "réapprendre"), (Lang.en, "relearn"), (Lang.es, "reaprender")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("relight", "relit/relighted", "relit/relighted"), translations: [(Lang.fr, "rallumer/ranimer"), (Lang.en, "relight"), (Lang.es, "encender de nuevo")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("remake", "remade", "remade"), translations: [(Lang.fr, "pré-fabriquer"), (Lang.en, "remake"), (Lang.es, "preparar algo por adelantado")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("repay", "repaid", "repaid"), translations: [(Lang.fr, "prépayer"), (Lang.en, "repay"), (Lang.es, "pagar por anticipado")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("reread", "reread", "reread"), translations: [(Lang.fr, "relire"), (Lang.en, "reread"), (Lang.es, "releer")]),
            Verbe(level: Level.B2, form: Form.ABA, verbe: ("rerun", "reran", "rerun"), translations: [(Lang.fr, "courir de nouveau"), (Lang.en, "rerun"), (Lang.es, "repetir una carrera")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("resell", "resold", "resold"), translations: [(Lang.fr, "pré-vendre"), (Lang.en, "resell"), (Lang.es, "promocionar algo")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("resend", "resent", "resent"), translations: [(Lang.fr, "renvoyer"), (Lang.en, "resend"), (Lang.es, "reenviar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("resew", "resewed", "resewn/resewed"), translations: [(Lang.fr, "recoudre"), (Lang.en, "resew"), (Lang.es, "recoser")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("retake", "retook", "retaken"), translations: [(Lang.fr, "reprendre"), (Lang.en, "retake"), (Lang.es, "recuperar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("reteach", "retaught", "retaught"), translations: [(Lang.fr, "renseigner"), (Lang.en, "reteach"), (Lang.es, "reenseñar")]),
            Verbe(level: Level.C1, form: Form.ABC, verbe: ("retear", "retore", "retorn"), translations: [(Lang.fr, "déchirer de nouveau"), (Lang.en, "retear"), (Lang.es, "volver a desgarrar(se)")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("retell", "retold", "retold"), translations: [(Lang.fr, "prévoir/prédire/présager"), (Lang.en, "retell"), (Lang.es, "predecir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rethink", "rethought", "rethought"), translations: [(Lang.fr, "repenser"), (Lang.en, "rethink"), (Lang.es, "reconsiderar/reflexionar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("retread", "retread", "retread"), translations: [(Lang.fr, "réchapper"), (Lang.en, "retread"), (Lang.es, "repisar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("retrofit", "retrofitted/retrofit", "retrofitted/retrofit"), translations: [(Lang.fr, "rénover/modifier/réajuster"), (Lang.en, "retrofit"), (Lang.es, "modernizar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("rewake", "rewoke/rewaked", "rewaken/rewaked"), translations: [(Lang.fr, "réveiller de nouveau"), (Lang.en, "rewake"), (Lang.es, "volver a despertarse")]),
            Verbe(level: Level.B2, form: Form.ABC, verbe: ("rewear", "rewore", "reworn"), translations: [(Lang.fr, "reporter"), (Lang.en, "rewear"), (Lang.es, "volver a ponerse algo")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("reweave", "rewove/reweaved", "rewoven/reweaved"), translations: [(Lang.fr, "retisser"), (Lang.en, "reweave"), (Lang.es, "rearmar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("rewed", "rewed/rewedded", "rewed/rewedded"), translations: [(Lang.fr, "se remarier"), (Lang.en, "rewed"), (Lang.es, "casarse de nuevo")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("rewet", "rewet/rewetted", "rewet/rewetted"), translations: [(Lang.fr, "remouiller"), (Lang.en, "rewet"), (Lang.es, "remojar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("rewin", "rewon", "rewon"), translations: [(Lang.fr, "regagner"), (Lang.en, "rewin"), (Lang.es, "volver a ganar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("rewind", "rewound", "rewound"), translations: [(Lang.fr, "rembobiner"), (Lang.en, "rewind"), (Lang.es, "rebobinar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("rewrite", "rewrote", "rewritten"), translations: [(Lang.fr, "réécrire"), (Lang.en, "rewrite"), (Lang.es, "reescribir")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("rid", "rid", "rid"), translations: [(Lang.fr, "débarrasser"), (Lang.en, "rid"), (Lang.es, "deshacerse")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("ride", "rode", "ridden"), translations: [(Lang.fr, "monter (vélo"), (Lang.en, "ride"), (Lang.es, " cheval)")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("ring", "rang", "rung"), translations: [(Lang.fr, "sonner/téléphoner"), (Lang.en, "ring"), (Lang.es, "llamar/sonar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("rise", "rose", "risen"), translations: [(Lang.fr, "lever"), (Lang.en, "rise"), (Lang.es, "subir/crecer")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("roughcast", "roughcast", "roughcast"), translations: [(Lang.fr, "crépir"), (Lang.en, "roughcast"), (Lang.es, "bosquejar")]),
            Verbe(level: Level.A2, form: Form.ABA, verbe: ("run", "ran", "run"), translations: [(Lang.fr, "courir"), (Lang.en, "run"), (Lang.es, "correr")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("sand-cast", "sand-cast", "sand-cast"), translations: [(Lang.fr, "poncer"), (Lang.en, "sand-cast"), (Lang.es, "pulir")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("saw", "saw/sawed", "sawn/sawed"), translations: [(Lang.fr, "scier"), (Lang.en, "saw"), (Lang.es, "serruchar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("say", "said", "said"), translations: [(Lang.fr, "dire"), (Lang.en, "say"), (Lang.es, "decir")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("see", "saw", "seen"), translations: [(Lang.fr, "voir"), (Lang.en, "see"), (Lang.es, "ver")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("seek", "sought", "sought"), translations: [(Lang.fr, "chercher"), (Lang.en, "seek"), (Lang.es, "buscar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("sell", "sold", "sold"), translations: [(Lang.fr, "vendre"), (Lang.en, "sell"), (Lang.es, "vender")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("send", "sent", "sent"), translations: [(Lang.fr, "envoyer"), (Lang.en, "send"), (Lang.es, "enviar")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("set", "set", "set"), translations: [(Lang.fr, "fixer"), (Lang.en, "set"), (Lang.es, "colocar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("sew", "sewed", "sewn/sewed"), translations: [(Lang.fr, "coudre trop"), (Lang.en, "sew"), (Lang.es, "sobrehilar")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("shake", "shook", "shaken"), translations: [(Lang.fr, "secouer"), (Lang.en, "shake"), (Lang.es, "agitar")]),
            Verbe(level: Level.B1, form: Form.enUs, verbe: ("shave", "shaved", "shaved/shaven"), translations: [(Lang.fr, "raser"), (Lang.en, "shave"), (Lang.es, "afeitar/depilar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("shear", "sheared", "sheared/shorn"), translations: [(Lang.fr, "mal entendre"), (Lang.en, "shear"), (Lang.es, "escuchar/entender algo mal")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("shed", "shed", "shed"), translations: [(Lang.fr, "répandre/laisser tomber"), (Lang.en, "shed"), (Lang.es, "mudar(se)")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("shine", "shone", "shone"), translations: [(Lang.fr, "briller"), (Lang.en, "shine"), (Lang.es, "brillar")]),
            Verbe(level: Level.B1, form: Form.enUs, verbe: ("shit", "shit/shat/shitted", "shit/ shat/shitted"), translations: [(Lang.fr, "chier (vulgaire)"), (Lang.en, "shit"), (Lang.es, "cagar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("shoot", "shot", "shot"), translations: [(Lang.fr, "tirer/fusiller"), (Lang.en, "shoot"), (Lang.es, "disparar")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("show", "showed", "shown"), translations: [(Lang.fr, "montrer"), (Lang.en, "show"), (Lang.es, "mostrar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("shrink", "shrank/shrunk", "shrunk"), translations: [(Lang.fr, "pré-rétrécir"), (Lang.en, "shrink"), (Lang.es, "preencoger")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("shut", "shut", "shut"), translations: [(Lang.fr, "fermer"), (Lang.en, "shut"), (Lang.es, "cerrar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("sight-read", "sight-read", "sight-read"), translations: [(Lang.fr, "déchiffrer"), (Lang.en, "sight-read"), (Lang.es, "improvisar")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("sing", "sang", "sung"), translations: [(Lang.fr, "chanter"), (Lang.en, "sing"), (Lang.es, "cantar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("sink", "sank/sunk", "sunk/sunken"), translations: [(Lang.fr, "couler"), (Lang.en, "sink"), (Lang.es, "hundirse")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("sit", "sat", "sat"), translations: [(Lang.fr, "s'asseoir"), (Lang.en, "sit"), (Lang.es, "sentarse")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("(kill)-slay", "slew/slayed", "slain/slayed"), translations: [(Lang.fr, "tuer/égorger"), (Lang.en, "(kill)-slay"), (Lang.es, "matar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("sleep", "slept", "slept"), translations: [(Lang.fr, "dormir"), (Lang.en, "sleep"), (Lang.es, "dormir")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("slide", "slid", "slid"), translations: [(Lang.fr, "glisser"), (Lang.en, "slide"), (Lang.es, "deslizar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("sling", "slung", "slung"), translations: [(Lang.fr, "élinguer/suspendre/jeter"), (Lang.en, "sling"), (Lang.es, "tirar/lanzar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("slink", "slunk/slinked", "slunk/slinked"), translations: [(Lang.fr, "s'en aller furtivement"), (Lang.en, "slink"), (Lang.es, "escabullirse")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("slit", "slit", "slit"), translations: [(Lang.fr, "fendre"), (Lang.en, "slit"), (Lang.es, "rajar/cortar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("smell", "smelt", "smelt"), translations: [(Lang.fr, "sentir"), (Lang.en, "smell"), (Lang.es, "oler")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("sneak", "sneaked/snuck", "sneaked/snuck"), translations: [(Lang.fr, "se faufiler/se glisser"), (Lang.en, "sneak"), (Lang.es, "pasar a hurtadillas")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("sow", "sowed", "sown/sowed"), translations: [(Lang.fr, "semer"), (Lang.en, "sow"), (Lang.es, "sembrar")]),
            Verbe(level: Level.A2, form: Form.ABBn, verbe: ("speak", "spoke", "spoken"), translations: [(Lang.fr, "parler"), (Lang.en, "speak"), (Lang.es, "hablar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("speed", "sped", "sped"), translations: [(Lang.fr, "aller vite"), (Lang.en, "speed"), (Lang.es, "correr")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("spell", "spelt", "spelt"), translations: [(Lang.fr, "épeler/orthographier"), (Lang.en, "spell"), (Lang.es, "deletrear")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("spend", "spent", "spent"), translations: [(Lang.fr, "dépenser/passer du temps"), (Lang.en, "spend"), (Lang.es, "gastar/pasar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("spill", "spilt/spilled", "spilt/spilled"), translations: [(Lang.fr, "renverser"), (Lang.en, "spill"), (Lang.es, "derramar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("spin", "spun", "spun"), translations: [(Lang.fr, "tourner/faire tourner"), (Lang.en, "spin"), (Lang.es, "girar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("spit", "spat/spit", "spat/spit"), translations: [(Lang.fr, "cracher"), (Lang.en, "spit"), (Lang.es, "escupir")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("split", "split", "split"), translations: [(Lang.fr, "fendre"), (Lang.en, "split"), (Lang.es, "separar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("spoil", "spoilt", "spoilt"), translations: [(Lang.fr, "gâcher/gâter"), (Lang.en, "spoil"), (Lang.es, "consentir/arruinar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("spoon-feed", "spoon-fed", "spoon-fed"), translations: [(Lang.fr, "nourrir à la cuillère"), (Lang.en, "spoon-feed"), (Lang.es, "dar algo en bandeja")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("spread", "spread", "spread"), translations: [(Lang.fr, "répandre"), (Lang.en, "spread"), (Lang.es, "extender")]),
            Verbe(level: Level.B2, form: Form.iau, verbe: ("spring", "sprang", "sprung"), translations: [(Lang.fr, "surgir/jaillir/bondir"), (Lang.en, "spring"), (Lang.es, "saltar/brotar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("stand", "stood", "stood"), translations: [(Lang.fr, "être debout"), (Lang.en, "stand"), (Lang.es, "ponerse de pie/pararse")]),
            Verbe(level: Level.B1, form: Form.ABBn, verbe: ("steal", "stole", "stolen"), translations: [(Lang.fr, "voler/dérober"), (Lang.en, "steal"), (Lang.es, "robar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("stick", "stuck", "stuck"), translations: [(Lang.fr, "coller"), (Lang.en, "stick"), (Lang.es, "pegar/clavar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("sting", "stung", "stung"), translations: [(Lang.fr, "piquer"), (Lang.en, "sting"), (Lang.es, "picar")]),
            Verbe(level: Level.B1, form: Form.iau, verbe: ("stink", "stank", "stunk"), translations: [(Lang.fr, "puer"), (Lang.en, "stink"), (Lang.es, "apestar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("strew", "strewed", "strewn/strewed"), translations: [(Lang.fr, "éparpiller"), (Lang.en, "strew"), (Lang.es, "esparcir")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("stride", "strode", "stridden"), translations: [(Lang.fr, "arpenter"), (Lang.en, "stride"), (Lang.es, "dar zancadas")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("(delete)-strike", "struck", "stricken"), translations: [(Lang.fr, "rayer/biffer"), (Lang.en, "(delete)-strike"), (Lang.es, "atacar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("(hit)-strike", "struck", "struck/stricken"), translations: [(Lang.fr, "frapper"), (Lang.en, "(hit)-strike"), (Lang.es, "golpear")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("string", "strung", "strung"), translations: [(Lang.fr, "corder"), (Lang.en, "string"), (Lang.es, "enhebrar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("strive", "strove", "striven"), translations: [(Lang.fr, "s'efforcer"), (Lang.en, "strive"), (Lang.es, "esforzarse")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("sublet", "sublet", "sublet"), translations: [(Lang.fr, "sous-louer"), (Lang.en, "sublet"), (Lang.es, "subarrendar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("sunburn", "sunburned/sunburnt", "sunburned/sunburnt"), translations: [(Lang.fr, "se bronzer"), (Lang.en, "sunburn"), (Lang.es, "quemarse al sol")]),
            Verbe(level: Level.B1, form: Form.ABC, verbe: ("swear", "swore", "sworn"), translations: [(Lang.fr, "jurer"), (Lang.en, "swear"), (Lang.es, "jurar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("sweat", "sweat/sweated", "sweat/sweated"), translations: [(Lang.fr, "suer"), (Lang.en, "sweat"), (Lang.es, "sudar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("sweep", "swept", "swept"), translations: [(Lang.fr, "balayer"), (Lang.en, "sweep"), (Lang.es, "barrer")]),
            Verbe(level: Level.B1, form: Form.enUs, verbe: ("swell", "swelled", "swollen/swelled"), translations: [(Lang.fr, "gonfler/enfler"), (Lang.en, "swell"), (Lang.es, "crecer")]),
            Verbe(level: Level.A2, form: Form.iau, verbe: ("swim", "swam", "swum"), translations: [(Lang.fr, "nager"), (Lang.en, "swim"), (Lang.es, "nadar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("swing", "swung", "swung"), translations: [(Lang.fr, "se balancer"), (Lang.en, "swing"), (Lang.es, "balancear(se)")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("take", "took", "taken"), translations: [(Lang.fr, "prendre"), (Lang.en, "take"), (Lang.es, "agarrar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("teach", "taught", "taught"), translations: [(Lang.fr, "enseigner"), (Lang.en, "teach"), (Lang.es, "enseñar")]),
            Verbe(level: Level.B2, form: Form.ABC, verbe: ("tear", "tore", "torn"), translations: [(Lang.fr, "déchirer"), (Lang.en, "tear"), (Lang.es, "arrancar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("telecast", "telecast", "telecast"), translations: [(Lang.fr, "diffuser à la télévision"), (Lang.en, "telecast"), (Lang.es, "emitir")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("tell", "told", "told"), translations: [(Lang.fr, "dire/raconter"), (Lang.en, "tell"), (Lang.es, "decir")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("test-drive", "test-drove", "test-driven"), translations: [(Lang.fr, "faire un tour d’essai"), (Lang.en, "test-drive"), (Lang.es, "probar la conducción")]),
            Verbe(level: Level.C1, form: Form.ABC, verbe: ("test-fly", "test-flew", "test-flown"), translations: [(Lang.fr, "faire un vol d’essai"), (Lang.en, "test-fly"), (Lang.es, "probar una aeronave")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("think", "thought", "thought"), translations: [(Lang.fr, "penser"), (Lang.en, "think"), (Lang.es, "pensar")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("throw", "threw", "thrown"), translations: [(Lang.fr, "jeter"), (Lang.en, "throw"), (Lang.es, "tirar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("thrust", "thrust", "thrust"), translations: [(Lang.fr, "enfoncer"), (Lang.en, "thrust"), (Lang.es, "empujar")]),
            Verbe(level: Level.C1, form: Form.ABBn, verbe: ("tread", "trod", "trodden"), translations: [(Lang.fr, "piétiner quelque chose"), (Lang.en, "tread"), (Lang.es, "pisar/aplastar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("typecast", "typecast", "typecast"), translations: [(Lang.fr, "cataloguer"), (Lang.en, "typecast"), (Lang.es, "encasillar")]),
            Verbe(level: Level.B2, form: Form.AAA, verbe: ("typeset", "typeset", "typeset"), translations: [(Lang.fr, "composer"), (Lang.en, "typeset"), (Lang.es, "componer")]),
            Verbe(level: Level.C1, form: Form.ABAn, verbe: ("typewrite", "typewrote", "typewritten"), translations: [(Lang.fr, "dactylographier"), (Lang.en, "typewrite"), (Lang.es, "mecanografiar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unbend", "unbent", "unbent"), translations: [(Lang.fr, "détendre/redresser"), (Lang.en, "unbend"), (Lang.es, "enderezar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unbind", "unbound", "unbound"), translations: [(Lang.fr, "délier/détacher"), (Lang.en, "unbind"), (Lang.es, "desatar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("unclothe", "unclothed/unclad", "unclothed/unclad"), translations: [(Lang.fr, "déshabiller/dévêtir"), (Lang.en, "unclothe"), (Lang.es, "desnudar")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("underbid", "underbid", "underbid"), translations: [(Lang.fr, "sous-enchérir"), (Lang.en, "underbid"), (Lang.es, "pujar por debajo")]),
            Verbe(level: Level.C1, form: Form.AAA, verbe: ("undercut", "undercut", "undercut"), translations: [(Lang.fr, "saper/miner"), (Lang.en, "undercut"), (Lang.es, "vender más barato que")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("underfeed", "underfed", "underfed"), translations: [(Lang.fr, "sous-alimenter"), (Lang.en, "underfeed"), (Lang.es, "malnutrir")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("undergo", "underwent", "undergone"), translations: [(Lang.fr, "subir"), (Lang.en, "undergo"), (Lang.es, "someterse/padecer")]),
            Verbe(level: Level.C1, form: Form.ABC, verbe: ("underlie", "underlay", "underlain"), translations: [(Lang.fr, "être à la base de/sous-tendre"), (Lang.en, "underlie"), (Lang.es, "sustentar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("undersell", "undersold", "undersold"), translations: [(Lang.fr, "supplanter"), (Lang.en, "undersell"), (Lang.es, "malvender")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("underspend", "underspent", "underspent"), translations: [(Lang.fr, "ne pas tout dépenser"), (Lang.en, "underspend"), (Lang.es, "escatimar")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("understand", "understood", "understood"), translations: [(Lang.fr, "comprendre"), (Lang.en, "understand"), (Lang.es, "comprender")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("undertake", "undertook", "undertaken"), translations: [(Lang.fr, "entreprendre"), (Lang.en, "undertake"), (Lang.es, "comprometerse")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("underwrite", "underwrote", "underwritten"), translations: [(Lang.fr, "souscrire/garantir"), (Lang.en, "underwrite"), (Lang.es, "suscribir")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("undo", "undid", "undone"), translations: [(Lang.fr, "défaire"), (Lang.en, "undo"), (Lang.es, "deshacer")]),
            Verbe(level: Level.B2, form: Form.ABBn, verbe: ("unfreeze", "unfroze", "unfrozen"), translations: [(Lang.fr, "décongeler"), (Lang.en, "unfreeze"), (Lang.es, "descongelar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unhang", "unhung", "unhung"), translations: [(Lang.fr, "décrocher qq. chose"), (Lang.en, "unhang"), (Lang.es, "descolgar")]),
            Verbe(level: Level.B2, form: Form.ABAn, verbe: ("unhide", "unhid", "unhidden"), translations: [(Lang.fr, "dévoiler/révéler"), (Lang.en, "unhide"), (Lang.es, "mostrar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("unknit", "unknitted/unknit", "unknitted/unknit"), translations: [(Lang.fr, "détricoter"), (Lang.en, "unknit"), (Lang.es, "separar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unlearn", "unlearned/unlearnt", "unlearned/unlearnt"), translations: [(Lang.fr, "désapprendre"), (Lang.en, "unlearn"), (Lang.es, "olvidar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("unsew", "unsewed", "unsewn/unsewed"), translations: [(Lang.fr, "découdre"), (Lang.en, "unsew"), (Lang.es, "descoser")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("unsling", "unslung", "unslung"), translations: [(Lang.fr, "débrider"), (Lang.en, "unsling"), (Lang.es, "descolgar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unspin", "unspun", "unspun"), translations: [(Lang.fr, "défaire"), (Lang.en, "unspin"), (Lang.es, "desenrollar/enderezar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unstick", "unstuck", "unstuck"), translations: [(Lang.fr, "décoller"), (Lang.en, "unstick"), (Lang.es, "despegar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unstring", "unstrung", "unstrung"), translations: [(Lang.fr, "détendre les cordes"), (Lang.en, "unstring"), (Lang.es, "desabrochar")]),
            Verbe(level: Level.C1, form: Form.enUs, verbe: ("unweave", "unwove/unweaved", "unwoven/unweaved"), translations: [(Lang.fr, "dé-tisser"), (Lang.en, "unweave"), (Lang.es, "destrenzar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("unwind", "unwound", "unwound"), translations: [(Lang.fr, "se détendre/se relaxer/dérouler/dévider"), (Lang.en, "unwind"), (Lang.es, "desenrollar/desenmarañar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("uphold", "upheld", "upheld"), translations: [(Lang.fr, "faire respecter/défendre"), (Lang.en, "uphold"), (Lang.es, "sostener")]),
            Verbe(level: Level.B1, form: Form.AAA, verbe: ("upset", "upset", "upset"), translations: [(Lang.fr, "contrarier/bouleverser"), (Lang.en, "upset"), (Lang.es, "molestar")]),
            Verbe(level: Level.A2, form: Form.ABBn, verbe: ("wake", "woke", "woken"), translations: [(Lang.fr, "réveiller"), (Lang.en, "wake"), (Lang.es, "despertar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("waylay", "waylaid", "waylaid"), translations: [(Lang.fr, "attaquer/interrompre"), (Lang.en, "waylay"), (Lang.es, "abordar")]),
            Verbe(level: Level.A2, form: Form.ABC, verbe: ("wear", "wore", "worn"), translations: [(Lang.fr, "porter (avoir sur soi)"), (Lang.en, "wear"), (Lang.es, "llevar")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("weave", "wove/weaved", "woven/weaved"), translations: [(Lang.fr, "entrelacer"), (Lang.en, "weave"), (Lang.es, "entretejer")]),
            Verbe(level: Level.B2, form: Form.enUs, verbe: ("wed", "wed/wedded", "wed/wedded"), translations: [(Lang.fr, "marier"), (Lang.en, "wed"), (Lang.es, "casar(se)")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("weep", "wept", "wept"), translations: [(Lang.fr, "pleurer"), (Lang.en, "weep"), (Lang.es, "llorar")]),
            Verbe(level: Level.B1, form: Form.ABB, verbe: ("wet", "wet/wetted", "wet/wetted"), translations: [(Lang.fr, "mouiller"), (Lang.en, "wet"), (Lang.es, "humedecer")]),
            Verbe(level: Level.A2, form: Form.ABB, verbe: ("win", "won", "won"), translations: [(Lang.fr, "gagner"), (Lang.en, "win"), (Lang.es, "ganar")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("wind", "wound", "wound"), translations: [(Lang.fr, "enrouler/remonter"), (Lang.en, "wind"), (Lang.es, "envolver")]),
            Verbe(level: Level.B1, form: Form.ABAn, verbe: ("withdraw", "withdrew", "withdrawn"), translations: [(Lang.fr, "retirer"), (Lang.en, "withdraw"), (Lang.es, "retirar")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("withhold", "withheld", "withheld"), translations: [(Lang.fr, "retenir"), (Lang.en, "withhold"), (Lang.es, "retener")]),
            Verbe(level: Level.C1, form: Form.ABB, verbe: ("withstand", "withstood", "withstood"), translations: [(Lang.fr, "résister"), (Lang.en, "withstand"), (Lang.es, "resistir")]),
            Verbe(level: Level.B2, form: Form.ABB, verbe: ("wring", "wrung", "wrung"), translations: [(Lang.fr, "tordre"), (Lang.en, "wring"), (Lang.es, "estrujar")]),
            Verbe(level: Level.A2, form: Form.ABAn, verbe: ("write", "wrote", "written"), translations: [(Lang.fr, "écrire"), (Lang.en, "write"), (Lang.es, "escribir")]),
            
            ]
    
    
    func filterBy(_ form: Form, level: Level) -> [Verbe] {
        let sortedVerbes = verbes.filter({$0.form == form})
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
        
    }
    
    func filterBy(_ prefixes: [String]) -> [Verbe]{
        return verbes.filter({
            var hasPrefix = false
            for prefix in prefixes{
                hasPrefix = hasPrefix || $0.infinitf().hasPrefix(prefix)
            }
            return hasPrefix
        })
    }
    
    func filterBy(_ beginLetter: LetterButton, level: Level) -> [Verbe]{
        let sortedVerbes = filterBy(beginLetter.rawValue.components(separatedBy: "-"))
        if(level == Level.All){
            return sortedVerbes
        }
        else{
            return sortedVerbes.filter({$0.level == level})
        }
    }
    
    
    
    
    // develop
    func witchCategoriesAreNotAvalable(){
        print(verbes.count)
        for level in Level.allValues{
            for form in Form.allValues{
                if (filterBy(form, level: level).count == 0){
                    print("\(form)  \(level) \n")
                }
            }
            
            for letter in LetterButton.allValues{
                if (filterBy(letter, level: level).count == 0){
                    print("\(letter)  \(level) \n")
                }
            }
        }
    }
    
}










