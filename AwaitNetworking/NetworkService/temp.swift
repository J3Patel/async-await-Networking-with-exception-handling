//
//  JPDataResponse.swift
//  JPDataResponse
//
//  Created by Jatin on 21/09/21.
//

import Foundation


func call() async {
    
    PlanAPIService().getPlan(with: "4") { result in
        switch result {
        case .success(let parts):
            for m in parts {
                print(m.name ?? "")
            }
            break
        case .failure(let error):
            print(error)
            break
        }
    }
    
    
    //        if let data = readLocalFile(forName: "json_data") {
    //            let bodyParts = try! DataModeller<JPDataResponse<[BodyPart]>>()
    //                        .parse(from: data)
    //            if case let .data(model) = bodyParts  {
    //
    //                    print(model)
    //            }
    //        }
    
}



private func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}
