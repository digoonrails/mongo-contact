class Contact
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true
end
