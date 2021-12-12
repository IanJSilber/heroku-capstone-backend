
User.create!([
  {name: "Ian", email: "Ian@test.com", password_digest: "$2a$12$5ADbgxezP/GD9TRsuHTs3.p3LoKMSoL11pCi/WRbfkP/Q87Hfee5O"},
])
Position.create!([
  {asset: "ETHUSDT", amount: 12, user_id: 1},
  {asset: "LUNAUSDT", amount: 107, user_id: 1},
  {asset: "BTCUSDT", amount: 1, user_id: 1}
])