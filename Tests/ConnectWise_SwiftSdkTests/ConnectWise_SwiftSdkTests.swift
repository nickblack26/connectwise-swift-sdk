import Testing
@testable import ConnectWise_SwiftSdk

let psa = ManageClient(
    host: "manage.velomethod.com",
    username: "velo+gzqmu9YTWvMsnNz1",
    password: "mDcuqcDyNosHKFNy",
    clientId: "900822ef-aa1c-4f08-aae6-f070919b56fa"
)

@Test func getTickets() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
 
    let tickets: [Ticket] = try await psa.service.get(path: .tickets) as! [Ticket]
    #expect(tickets.count > 0)
}



@Test(arguments: [703126])  func getTicket(id: Int) async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let ticket: Ticket = try await psa.service.get(path: .ticket(id: id)) as! Ticket
    #expect(ticket.id == id)
}
