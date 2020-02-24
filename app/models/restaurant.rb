class Restaurant < ApplicationRecord
  belongs_to :user

  enum price: [:cheap, :affordable, :pricey, :expensive]

  enum eatin: [:recommended, :veto]

  enum takeout: [:go, :pass]
end
