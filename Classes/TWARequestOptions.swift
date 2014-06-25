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

    if(options.count > 0 ) {
      paramString.appendString("?")
      
      for(key, value) in options {
        paramString.appendString("")
        paramString.appendString("&")
      }
    }
    
    return paramString
  }
}