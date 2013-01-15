class Address
  include Mongoid::Document
  field :address, type: String
  field :number, type: String
  field :zipcode, type: String
  
  belongs_to :contact
end
