
User.create!([
  {name: "Test name", email: "test@test.com", password_digest: "$2a$12$5ADbgxezP/GD9TRsuHTs3.p3LoKMSoL11pCi/WRbfkP/Q87Hfee5O"},
  {name: "Ian Silber", email: "ian@test.com", password_digest: "$2a$12$OJs0vWSPNdOoba9ZEtDp6.zbMMMPdqkjtWGMHmWmCQa/mKvCJUI2C"}
])
Position.create!([
  {asset: "ETH", amount: 12, user_id: 1},
  {asset: "LUNA", amount: 107, user_id: 1},
  {asset: "BTC", amount: 1, user_id: 1},
  {asset: "BTC", amount: 1, user_id: 2}
])