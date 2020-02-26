class Restaurant < ApplicationRecord
  belongs_to :user

  enum price: [:cheap, :affordable, :pricey, :expensive]

  # For the form dropdown
  def self.prices_options
    [
      ['💰', :cheap],
      ['💰💰', :afforable],
      ['💰💰💰', :pricey],
      ['💰💰💰💰', :expensive]
    ]
  end

  # For the show page
  def price_display
    lookup = {
      'cheap' => '$',
      'affordable' => '$$',
      'pricey' => '$$$',
      'expensive' => '$$$$'
    }
    lookup[price]  # return the dollar signs corresponding to this price enum value
  end

  enum eatin: [:recommended, :veto]

  # For the form dropdown
  def self.eatin_options
    [
      ['👍🏼', :recommended],
      ['👎🏼', :veto]
    ]
  end

  # For the show page
  def eatin_display
    lookup = {
      'cheap' => '$',
      'affordable' => '$$',
      'pricey' => '$$$',
      'expensive' => '$$$$'
    }
    lookup[price]  # return the dollar signs corresponding to this price enum value
  end

  enum eatout: [:go, :pass]

  # Get random Restaurant
  # def rand_rest
  #
  #
  #
  # end

end
