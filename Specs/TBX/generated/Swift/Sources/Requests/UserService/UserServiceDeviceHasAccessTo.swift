//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TBX.UserService {

    /**
    Check if the Device has access to execute an action with the URN
    */
    public enum UserServiceDeviceHasAccessTo {

        public static let service = APIService<Response>(id: "UserService.deviceHasAccessTo", tag: "UserService", method: "GET", path: "/UserServices/device/{device}/hasAccessTo", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The device token */
                public var device: String

                /** This must start with 'urn:' */
                public var urn: String

                /** Value that identifies what type of action the CP user is executing. */
                public var action: String

                /** The client IP, is necessary to prevent many user use the same token */
                public var ip: String

                public init(device: String, urn: String, action: String, ip: String) {
                    self.device = device
                    self.urn = urn
                    self.action = action
                    self.ip = ip
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: UserServiceDeviceHasAccessTo.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(device: String, urn: String, action: String, ip: String) {
                let options = Options(device: device, urn: urn, action: action, ip: ip)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "device" + "}", with: "\(self.options.device)")
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["urn"] = options.urn
                params["action"] = options.action
                params["ip"] = options.ip
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = HasAccessToObject

            /** Request was successful */
            case status200(HasAccessToObject)

            /** Bad Request  */
            case status400(ResponseError)

            /** Unauthorized  */
            case status401(ResponseError)

            /** Customer or Device not Found */
            case status404(ResponseError)

            /** The IDP took too long to respond */
            case status408(ResponseError)

            /** Device was Logged Out or the customer not longer exists */
            case status410(ResponseError)

            /** The IDP return an error or the received response from IDP is invalid */
            case status424(ResponseError)

            public var success: HasAccessToObject? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ResponseError? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status408(let response): return response
                case .status410(let response): return response
                case .status424(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<HasAccessToObject, ResponseError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .status408(let response): return response
                case .status410(let response): return response
                case .status424(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status404: return 404
                case .status408: return 408
                case .status410: return 410
                case .status424: return 424
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status404: return false
                case .status408: return false
                case .status410: return false
                case .status424: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(HasAccessToObject.self, from: data))
                case 400: self = try .status400(decoder.decode(ResponseError.self, from: data))
                case 401: self = try .status401(decoder.decode(ResponseError.self, from: data))
                case 404: self = try .status404(decoder.decode(ResponseError.self, from: data))
                case 408: self = try .status408(decoder.decode(ResponseError.self, from: data))
                case 410: self = try .status410(decoder.decode(ResponseError.self, from: data))
                case 424: self = try .status424(decoder.decode(ResponseError.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
