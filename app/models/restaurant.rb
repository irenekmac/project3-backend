class Restaurant < ApplicationRecord
  belongs_to :user

  enum price: [:cheap, :affordable, :pricey, :expensive]

  enum eatin: [:recommended, :veto]

  enum eatout: [:go, :pass]

  # Get random Restaurant
  # def rand_rest
  #
  #
  #
  # end

end
