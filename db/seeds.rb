User.destroy_all

u1 = User.create! name:'Minter Ellison', contact:'02 9424 2342', email:'minters@test.co', address:'1 Farrer Pl, Sydney NSW 2000', password:'chicken'
u2 = User.create! name:'MYOB', contact:'02 9023 2346', email:'myob@test.com', address:'Level 2/309 Kent St, Sydney NSW 2000', password:'chicken'
u3 = User.create! name:'General Assembly', contact:'02 9537 6328', email:'ga@test.com', address:'1 Market St, Sydney NSW 2000', password:'chicken'
puts "Created #{User.count} users."


Restaurant.destroy_all

# enum price: [:cheap, :affordable, :pricey, :expensive]
# enum eatin: [:recommended, :veto]
# enum eatout: [:go, :pass]

r1 = Restaurant.create! name:'El Loco', description:'modern twist of mexican food', contact:'(02) 9114 7339', email:'el-loco@test.com', website:'https://merivale.com/venues/excelsior/?utm_source=googlemybusiness_venue&utm_medium=organic&utm_campaign=googlemybusiness_venue_organic_ellocoatexcelsior&utm_content=website', address:'64 Foveaux St, Surry Hills NSW 2010', price:'pricey', cuisine:'Mexican', eatout:'pass', eatin:'recommended',
image:'https://assets.atdw-online.com.au/images/292796299602f9d7a5b8ed6908764b74.jpeg?rect=476,0,2048,1536&w=745&h=559&&rot=360', user_id:u1.id

r2 = Restaurant.create! name:'Chat Thai', description:'inspired by founder Amy Chanta’s home cooking but are embellished. The 103 dishes available prove Thai cuisine is about more than just pad thai and satay.', contact:'(02) 9247 3053', email:'westfield@chatthai.com.au', website:'https://www.chatthai.com.au/', address:'Level 6 188 Pitt St. Westfield Sydney', price:'affordable', cuisine:'pricey', eatout:'go', eatin:'recommended',
image:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTd4HMxWaEaV3Mqv9f_UUdyb_77wv4zwFGH_3iz4diyZGoH8bKU', user_id:u1.id

r3 = Restaurant.create! name:'Continental Deli', description:'from mortadella sandwiches and cheese toasties to hearty bowls of spaghetti – and it all comes in below $25.', contact:'(02) 9922 7347', email:'admin@test.com', website:'https://www.continentaldelicatessen.com.au/', address:'167 Phillip Street Sydney 2000', price:'affordable', cuisine:'European', eatout:'pass', eatin:'recommended',
image:'https://www.broadsheet.com.au/media/cache/e2/d5/e2d5852bd262b86ff5da89efbcf17b72.jpg', user_id:u2.id

r4 = Restaurant.create! name:'Bar Luca', description:'200 grams of succulent Wagyu, crisp maple-glazed bacon, molten American cheese, maple aioli and poutine between two soft milk buns.', contact:'(02) 9247 9700', email:'INFO@BARLUCA.COM.AU', website:'http://barluca.com.au/', address:'52 Phillip Street Sydney 2000', price:'pricey', cuisine:'American', eatout:'go', eatin:'recommended',
image:'https://www.broadsheet.com.au/media/cache/6b/e8/6be889db8a6e50610193a4d7ca379539.jpg', user_id:u2.id

r5 = Restaurant.create! name:'Rockpool Bar & Grill', description:'unpretentious menu boasts around 30 starters and about the same number of mains, with proteins from partridge and pheasant to wagyu beef and all manner of oceanic creatures.', contact:'(02) 8078 1900', email:'reservations@rockpoolbarandgrill.com', website:'http://www.rockpoolbarandgrill.com.au/', address:'66 Hunter Street Sydney', price:'expensive', cuisine:'Aussie', eatout:'pass', eatin:'recommended',
image:'https://www.broadsheet.com.au/media/cache/9a/5b/9a5b7968eeb335f2ef7b231af78fa390.jpg', user_id:u3.id

r6 = Restaurant.create! name:'Din Tai Fung', description:'yummy yummy yummy', contact:'(02) 8246 7032', email:'info@dintaifung.com', website:'http://www.dintaifungaustralia.com.au/', address:'Westfield Sydney 188 Pitt Street Sydney 2000', price:'cheap', cuisine:'Chinese', eatout:'go', eatin:'veto', image:'https://www.broadsheet.com.au/media/cache/38/51/3851cfe651695058f49e13883240cd4d.jpg', user_id:u3.id

puts "Created #{Restaurant.count} restaurants."
