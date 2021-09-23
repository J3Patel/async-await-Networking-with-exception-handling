//
//  JPEndpointFactory.swift
//  JPEndpointFactory
//
//  Created by Jatin on 22/09/21.
//

import Foundation

enum JPEndpointFactory {
    case login(number: String, countryCode: String)
    case verify(OTP: String, mobile: String, countryCode: String)
    case refresh
    case getBodyParts
    case selfAssessments
    case plan(planID: String)
    
    func build() -> JPEndpoint {
        switch self {
        case .login(let number, let countryCode):
            return LoginEndpoint(mobileNumber: number, countryCode: countryCode)
        case .verify(OTP: let otp, mobile: let mobile, countryCode: let countryCode):
            return VerifyEndpoint(otp: otp, mobileNumber: mobile, countryCode: countryCode)
        case .refresh:
            return RefreshEndpoint()
        case .getBodyParts:
            return GetBodyPartsEndpoint()
        case .selfAssessments:
            return SelfAssessmentsEndpoint()
        case .plan(planID: let planID):
            return PlanEndpoint(planID: planID)
        }
    }
}
