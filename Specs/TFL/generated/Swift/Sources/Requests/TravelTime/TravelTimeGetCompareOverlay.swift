//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.TravelTime {

    /**
    Gets the TravelTime overlay.
    */
    public enum TravelTimeGetCompareOverlay {

        public static let service = APIService<Response>(id: "TravelTime_GetCompareOverlay", tag: "TravelTime", method: "GET", path: "/TravelTimes/compareOverlay/{z}/mapcenter/{mapCenterLat}/{mapCenterLon}/pinlocation/{pinLat}/{pinLon}/dimensions/{width}/{height}", hasBody: false)

        /** The direction of travel. */
        public enum Direction: String, Codable {
            case average = "Average"
            case from = "From"
            case to = "To"

            public static let cases: [Direction] = [
              .average,
              .from,
              .to,
            ]
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The zoom level. */
                public var z: Int

                /** The latitude of the pin. */
                public var pinLat: Double

                /** The longitude of the pin. */
                public var pinLon: Double

                /** The map center latitude. */
                public var mapCenterLat: Double

                /** The map center longitude. */
                public var mapCenterLon: Double

                /** The title of the scenario. */
                public var scenarioTitle: String

                /** The id for the time of day (AM/INTER/PM) */
                public var timeOfDayId: String

                /** The id of the mode. */
                public var modeId: String

                /** The width of the requested overlay. */
                public var width: Int

                /** The height of the requested overlay. */
                public var height: Int

                /** The direction of travel. */
                public var direction: Direction

                /** The total minutes between the travel time bands */
                public var travelTimeInterval: Int

                public var compareType: String

                public var compareValue: String

                public init(z: Int, pinLat: Double, pinLon: Double, mapCenterLat: Double, mapCenterLon: Double, scenarioTitle: String, timeOfDayId: String, modeId: String, width: Int, height: Int, direction: Direction, travelTimeInterval: Int, compareType: String, compareValue: String) {
                    self.z = z
                    self.pinLat = pinLat
                    self.pinLon = pinLon
                    self.mapCenterLat = mapCenterLat
                    self.mapCenterLon = mapCenterLon
                    self.scenarioTitle = scenarioTitle
                    self.timeOfDayId = timeOfDayId
                    self.modeId = modeId
                    self.width = width
                    self.height = height
                    self.direction = direction
                    self.travelTimeInterval = travelTimeInterval
                    self.compareType = compareType
                    self.compareValue = compareValue
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: TravelTimeGetCompareOverlay.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(z: Int, pinLat: Double, pinLon: Double, mapCenterLat: Double, mapCenterLon: Double, scenarioTitle: String, timeOfDayId: String, modeId: String, width: Int, height: Int, direction: Direction, travelTimeInterval: Int, compareType: String, compareValue: String) {
                let options = Options(z: z, pinLat: pinLat, pinLon: pinLon, mapCenterLat: mapCenterLat, mapCenterLon: mapCenterLon, scenarioTitle: scenarioTitle, timeOfDayId: timeOfDayId, modeId: modeId, width: width, height: height, direction: direction, travelTimeInterval: travelTimeInterval, compareType: compareType, compareValue: compareValue)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "z" + "}", with: "\(self.options.z)").replacingOccurrences(of: "{" + "pinLat" + "}", with: "\(self.options.pinLat)").replacingOccurrences(of: "{" + "pinLon" + "}", with: "\(self.options.pinLon)").replacingOccurrences(of: "{" + "mapCenterLat" + "}", with: "\(self.options.mapCenterLat)").replacingOccurrences(of: "{" + "mapCenterLon" + "}", with: "\(self.options.mapCenterLon)").replacingOccurrences(of: "{" + "width" + "}", with: "\(self.options.width)").replacingOccurrences(of: "{" + "height" + "}", with: "\(self.options.height)")
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["scenarioTitle"] = options.scenarioTitle
                params["timeOfDayId"] = options.timeOfDayId
                params["modeId"] = options.modeId
                params["direction"] = options.direction.encode()
                params["travelTimeInterval"] = options.travelTimeInterval
                params["compareType"] = options.compareType
                params["compareValue"] = options.compareValue
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Object

            /** OK */
            case status200(Object)

            public var success: Object? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Object.self, from: data))
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
