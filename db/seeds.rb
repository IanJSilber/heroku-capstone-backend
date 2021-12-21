
User.create!([
  {name: "Ian", email: "Ian@test.com", password_digest: "$2a$12$5ADbgxezP/GD9TRsuHTs3.p3LoKMSoL11pCi/WRbfkP/Q87Hfee5O"},
])
Position.create!([])
Watchlist.create!([
  { name: "Currently watching", user_id: 1 }
])
Asset.create!([
  { symbol: "BTC", watchlist_id: 1 },
  { symbol: "ETH", watchlist_id: 1 },
  { symbol: "SOL", watchlist_id: 1 }
])