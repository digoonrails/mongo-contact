class Phone
  include Mongoid::Document
  field :ddd, type: String
  field :number, type: String
  
  belongs_to :contact
end