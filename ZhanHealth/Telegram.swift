//
//  Telegram.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/24/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation


class ZhanHealthBot {
  
  func sendMessage(message: String) {
    guard let url = URL(string: "https://api.telegram.org/bot758683852:AAGtREMsHEFap5AKZD1WSWj1-EI_lgV91dc/sendMessage") else { return }
    let parameters = ["chat_id":"-341225547","text":message]
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
    request.httpBody = httpBody
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      if let _ = response {
      }
      guard let data = data else { return }
      do {
        let _ = try? JSONSerialization.jsonObject(with: data, options: [])
      } catch {
        print(error)
      }
    }.resume()
  }
  
}
