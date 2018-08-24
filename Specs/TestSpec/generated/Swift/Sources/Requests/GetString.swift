//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TestSpec {

    /**
    operation with string response
    */
    public enum GetString {

        public static let service = APIService<Response>(id: "getString", tag: "", method: "GET", path: "/string", hasBody: false, securityRequirement: SecurityRequirement(type: "test_auth", scope: "read"))

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetString.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = String
            case status200(String)

            /** 400 response */
            case status400(String)

            public var success: String? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: String? {
                switch self {
                case .status400(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<String, String> {
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
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(String.self, from: data))
                case 400: self = try .status400(decoder.decode(String.self, from: data))
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
