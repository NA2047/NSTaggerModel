//
//  Model.swift
//  DemoCPSC599
//
//  Created by Andrew on 2017-10-10.
//  Copyright © 2017 Andrew. All rights reserved.
//

import Foundation

enum taggerTypeE {
    case NameType
    case LexicalClass
    
}

//extension TaggerOptions: ExpressibleByIntegerLiteral {
//    public init(integerLiteral value: Int) {
//        self = value != 0
//    }
//}

struct TaggerOptions:Equatable {
    static func ==(lhs: TaggerOptions, rhs: TaggerOptions) -> Bool {
        if (lhs.emotion == rhs.emotion && lhs.taggerOptions == rhs.taggerOptions && lhs.taggerSchema == rhs.taggerSchema){
            return true
        }
        else{
            return false
        }
    }
    
    var taggerOptions:NSLinguisticTagger.Options
    var taggerSchema:NSLinguisticTagScheme
    var emotion:String
}

enum taggerSwitch{
    case Emotion
    case Tagger
    case Schema
}


struct Model {
     var domLang : String?
     var arraySentences : [String]?
//    static let nameTypeOrLexicalClass: NSLinguisticTagScheme
    
    
    mutating func process(toBeProcess processString: String,lookfor lookingfor: taggerTypeE) -> [String]{
        
        var test : NSLinguisticTagScheme = .lexicalClass
        arraySentences = [String]()
        var  tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
        var tags: [NSLinguisticTag] = [.verb, .adjective, .adverb]
        tagger.string = processString
        domLang =  tagger.dominantLanguage
        
        var options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        var range = NSRange(location: 0, length: processString.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: test, options: options) { tag, tokenRange, _ in
            // Make sure that the tag that was found is in the list of tags that we care about.
            guard let tag = tag, tags.contains(tag) else { return }
            
            let token = (processString as NSString).substring(with: tokenRange)
            arraySentences!.append(token)
            arraySentences!.append(tag.rawValue)
            
            print("{token: \(token), tag: \(tag.rawValue), range: \(tokenRange)}")
        }

    return arraySentences!
        
    }
    
    mutating func process2(toBeProcess processString: String,lookfor lookingfor: taggerTypeE) -> [String]{
        
        var test : NSLinguisticTagScheme = .nameType
        arraySentences = [String]()
        var  tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
       
        var tags: [NSLinguisticTag] = [.personalName, .organizationName, .placeName]
        
        tagger.string = processString
        domLang =  tagger.dominantLanguage
        
       var options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        var range = NSRange(location: 0, length: processString.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: test, options: options) { tag, tokenRange, _ in
            // Make sure that the tag that was found is in the list of tags that we care about.
            guard let tag = tag, tags.contains(tag) else { return }
            
            let token = (processString as NSString).substring(with: tokenRange)
            arraySentences!.append(token)
            arraySentences!.append(tag.rawValue)
            
            print("{token: \(token), tag: \(tag.rawValue), range: \(tokenRange)}")
        }
        
        return arraySentences!
        
    }
    
    
}
    
