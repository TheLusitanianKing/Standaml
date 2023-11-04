let fetch_standing ~token ~competition =
  let route = Route.standing_route competition in
  Utils.Api.fetch ~token ~route ~parser:Model.Standing.parse
