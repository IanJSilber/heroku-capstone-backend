
User.create!([
  {name: "Ian", email: "Ian@test.com", password_digest: "$2a$12$5ADbgxezP/GD9TRsuHTs3.p3LoKMSoL11pCi/WRbfkP/Q87Hfee5O"},
])
Position.create!([
  {asset: "ETH", amount: 12, user_id: 1},
  {asset: "LUNA", amount: 107, user_id: 1},
  {asset: "BTC", amount: 1, user_id: 1}
])
Watchlist.create!([
  { name: "Currently watching", user_id: 1 }
])
Asset.create!([
  { name: "BTC", watchlist_id: 1 },
  { name: "ETH", watchlist_id: 1 },
  { name: "SOL", watchlist_id: 1 }
])