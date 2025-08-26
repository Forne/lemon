//
//  KinopoiskQuery.swift
//  lemon
//
//  Created by Dmitrii Pervin on 25.08.2025.
//

public struct KinopoiskQuery {
    public var page: Int? = nil
    public var limit: Int? = nil
    public var selectFields: [String]? = nil
    public var sortField: String? = nil
    public var sortType: Int? = nil
    
    public var filters: [String: String] = [:]
    
    public init() {}
    
    public func toParameters() -> [String: Any] {
        var p: [String: Any] = filters
        if let page { p["page"] = page }
        if let limit { p["limit"] = limit }
        if let select = selectFields, !select.isEmpty { p["selectFields"] = select }
        if let sortField { p["sortField"] = sortField }
        if let sortType { p["sortType"] = sortType } // 1 or -1
        return p
    }
    
    public func paging(page: Int, limit: Int) -> KinopoiskQuery {
        var q = self; q.page = page; q.limit = limit; return q
    }
    
    public func selecting(_ fields: [String]) -> KinopoiskQuery {
        var q = self; q.selectFields = fields; return q
    }
    
    public func sorting(field: String, type: Int = -1) -> KinopoiskQuery {
        var q = self; q.sortField = field; q.sortType = type; return q
    }
    
    public func filter(_ key: String, _ value: String) -> KinopoiskQuery {
        var q = self; q.filters[key] = value; return q
    }
}
