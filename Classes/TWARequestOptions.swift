//
//  TWARequestOptions.swift
//  WaltersAPI
//
//  Created by Ed Schmalzle on 6/13/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

import Foundation

class TWARequestOptions {
  var options = Dictionary<String, String>()
  
  init(options: Dictionary<String, String>) {
    self.options = options
  }
  
  func toParamString() -> (String) {
    var paramString:NSMutableString = ""
    
    let firstKey:String = options[options.startIndex]
    let lastKey:String = options[options.endIndex]
    
    if(options.count > 0 ) {
      paramString.appendString("?")
      
      for(key, value) in options {
        if(key.bridgeToObjectiveC().isEqualToString(firstKey)) { paramString.appendString("?") }
          
        paramString.appendString("")
          
        if(!(key.bridgeToObjectiveC().isEqualToString(lastKey))) { paramString.appendString("&") }
      }
      
      //TODO: remove the last &
    }
    
    return paramString
  }
}