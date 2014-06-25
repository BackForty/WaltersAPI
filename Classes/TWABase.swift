//
//  TWABase.swift
//  WaltersAPI
//
//  Created by Ed Schmalzle on 6/13/14.
//  Copyright (c) 2014 Back Forty. All rights reserved.
//

import Foundation

class TWABase : NSObject {
  let baseURL = "http://api.thewalters.org"
  let apiVersion = "v1"
  
  init(dictionary:Dictionary<String, String>) {
    
    super.init()
    
    let convertedDictionary:Dictionary<String, String> = convertDictionaryKeyCase(dictionary)
    for (key, value) in convertedDictionary {
      // TODO: Set these with kvc. Why doesn't the below work?
      // self.setValue(value: value, forKey: key)
    }
  }
  
  func requestForPath(resourcePath: String, requestOptions: TWARequestOptions) -> NSURLRequest {
    
    let versionedResourcePath = "\(baseURL)/\(apiVersion)/\(resourcePath)\(requestOptions.toParamString())"
    return NSURLRequest(URL: NSURL(string: versionedResourcePath))
  }
  
  func fetchData(request: NSURLRequest, successBlock: (NSDictionary) -> Void, failureBlock: (NSURLResponse, NSError) -> Void) {

    NSURLConnection.sendAsynchronousRequest(request,
      queue: NSOperationQueue.mainQueue(),
      completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        if(error) {
          failureBlock(response, error)
        } else {
          var parsingError: NSError?
          let responseData: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.MutableContainers,
            error: &parsingError) as NSDictionary
          
          if(parsingError) {
            failureBlock(response, parsingError!)
          } else {
            successBlock(responseData)
          }
        }
      }
    )
  }
  
  func convertDictionaryKeyCase(dictionary : Dictionary<String, String>) -> (Dictionary<String, String>) {
    return Dictionary<String, String>()
  }
  
  override func setValue(value: AnyObject!, forUndefinedKey key: String!) {
    NSLog("\(self) cannot set value for key: \(key) with value: \(value)")
  }
}