class Contact
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  
  has_many :addresses
  accepts_nested_attributes_for :addresses
end
