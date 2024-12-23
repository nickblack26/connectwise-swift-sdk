import Foundation

struct ReferenceType: Codable, Hashable, Identifiable, Sendable {
    var id: Int
    var name: String
    var type: String?
    var chargeFirmFlag: Bool?
}

struct Ticket: Codable, Hashable, Identifiable, Sendable {
    var id: Int
    var summary: String
    var recordType: String?
    var board: ReferenceType?
    var status: ReferenceType?
    var workRole: ReferenceType?
    var workType: ReferenceType?
    var company: ReferenceType?
    var site: ReferenceType?
    var siteName: String?
    var String: String?
    var addressLine2: String?
    var city: String?
    var stateIdentifier: String?
    var zip: String?
    var country: ReferenceType?
    var contact: ReferenceType?
    var contactName: String?
    var contactPhoneNumber: String?
    var contactPhoneExtension: String?
    var contactEmailAddress: String?
    var type: ReferenceType?
    var subType: ReferenceType?
    var item: ReferenceType?
    var team: ReferenceType?
    var owner: ReferenceType?
    var priority: ReferenceType?
    var serviceLocation: ReferenceType?
    var source: ReferenceType?
    var requiredDate: String?
    var budgetHours: Int?
    var opportunity: ReferenceType?
    var agreement: ReferenceType?
    var severity: String?
    var impact: String?
    var externalXRef: String?
    var poNumber: String?
    var knowledgeBaseCategoryID: Int?
    var knowledgeBaseSubCategoryID: Int?
    var allowAllClientsPortalView: Bool?
    var customerUpdatedFlag: Bool?
    var automaticEmailContactFlag: Bool?
    var automaticEmailResourceFlag: Bool?
    var automaticEmailCcFlag: Bool?
    var automaticEmailCc: String?
    var initialDescription: String?
    var initialInternalAnalysis: String?
    var initialResolution: String?
    var initialDescriptionFrom: String?
    var contactEmailLookup: String?
    var processNotifications: Bool?
    var skipCallback: Bool?
    var closedDate: String?
    var closedBy: String?
    var closedFlag: Bool?
    var actualHours: Double?
    var approved: Bool?
    var estimatedExpenseCost: Int?
    var estimatedExpenseRevenue: Int?
    var estimatedProductCost: Int?
    var estimatedProductRevenue: Int?
    var estimatedTimeCost: Int?
    var estimatedTimeRevenue: Int?
    var billingMethod: String?
    var billingAmount: Int?
    var hourlyRate: Int?
    var subBillingMethod: String?
    var subBillingAmount: Int?
    var subDateAccepted: String?
    var dateResolved: String?
    var dateResplan: String?
    var dateResponded: String?
    var resolveMinutes: Int?
    var resPlanMinutes: Int?
    var respondMinutes: Int?
    var isInSla: Bool?
    var knowledgeBaseLinkID: Int?
    var resources: String?
    var parentTicketID: Int?
    var hasChildTicket: Bool?
    var hasMergedChildTicketFlag: Bool?
    var knowledgeBaseLinkType: String?
    var billTime: String?
    var billExpenses: String?
    var billProducts: String?
    var predecessorType: String?
    var predecessorID: Int?
    var predecessorClosedFlag: Bool?
    var lagDays: Int?
    var lagNonworkingDaysFlag: Bool?
    var estimatedStartDate: String?
    var duration: Int?
    var location: ReferenceType?
    var department: ReferenceType?
    var mobileGUID: String?
    var sla: ReferenceType?
    var slaStatus: String?
    var requestForChangeFlag: Bool?
    var currency: Currency?
    var mergedParentTicket: ReferenceType?
    var integratorTags: [String]?
    var escalationStartDateUTC: String?
    var escalationLevel: Int?
    var minutesBeforeWaiting: Int?
    var respondedSkippedMinutes: Int?
    var resplanSkippedMinutes: Int?
    var respondedHours: Int?
    var respondedBy: String?
    var resplanHours: Int?
    var resplanBy: String?
    var resolutionHours: Int?
    var resolvedBy: String?
    var minutesWaiting: Int?
    var customFields: [CustomField]?
}

// MARK: - Currency
struct Currency: Codable, Hashable, Sendable {
    var id: Int?
    var symbol: String?
    var currencyCode: String?
    var decimalSeparator: String?
    var numberOfDecimals: Int?
    var thousandsSeparator: String?
    var negativeParenthesesFlag: Bool?
    var displaySymbolFlag: Bool?
    var currencyIdentifier: String?
    var displayIDFlag: Bool?
    var rightAlign: Bool?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case currencyCode = "currencyCode"
        case decimalSeparator = "decimalSeparator"
        case numberOfDecimals = "numberOfDecimals"
        case thousandsSeparator = "thousandsSeparator"
        case negativeParenthesesFlag = "negativeParenthesesFlag"
        case displaySymbolFlag = "displaySymbolFlag"
        case currencyIdentifier = "currencyIdentifier"
        case displayIDFlag = "displayIdFlag"
        case rightAlign = "rightAlign"
        case name = "name"
    }
}

struct CustomField: Codable, Hashable, Identifiable, Sendable {
    var id: Int
    var caption: String?
    var type: String?
    var entryMethod: String?
    var numberOfDecimals: Int?
    //    var value: Any?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case caption = "caption"
        case type = "type"
        case entryMethod = "entryMethod"
        case numberOfDecimals = "numberOfDecimals"
    }
}
