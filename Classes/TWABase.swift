//
//  TWABase.swift
//  WaltersAPI
//
//  Created by Ed Schmalzle on 6/13/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

import Foundation

class TWABase : NSObject {
  let baseURL = NSURL(string: "http://api.thewalters.org")
  
  init(dictionary:Dictionary<String, String>) {
    super.init()
    
    let convertedDictionary:Dictionary<String, String> = convertDictionaryKeyCase(dictionary)
    for (key, value) in convertedDictionary {
      // TODO: Set these with kvc. Why doesn't the below work?
      // self.setValue(value: value, forKey: key)
    }
  }
  
  func requestForPath(resourcePath:String, requestOptions:TWARequestOptions) -> NSURLRequest {
    let versionedResourcePath = "/v1\(resourcePath)\(requestOptions.toParamString)"
    
    NSString *pathWithParams = [self resourcePath: versionedResourcePath withParameters: parameters];
    NSURL *requestURL = [[NSURL alloc] initWithString: pathWithParams relativeToURL: baseURL];
    
    return [[NSURLRequest alloc] initWithURL: requestURL];
  }
  
  func resourcePath(pathString:String, parameters:NSDictionary) -> String {
    return String()
  }
  
  func fetchData(forRequest request: NSURLRequest, successBlock: (items: NSArray), failureBlock: (response:NSURLResponse, error:NSError)) {
    
  }
  
  func convertDictionaryKeyCase(dictionary:Dictionary<String, String>) -> (Dictionary<String, String>) {
    return Dictionary<String, String>()
  }
  
  override func setValue(value: AnyObject!, forUndefinedKey key: String!) {
    NSLog("\(self) cannot set value for key: \(key) with value: \(value)")
  }
}