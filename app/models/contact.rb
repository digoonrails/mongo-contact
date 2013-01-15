class Contact
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :kind, type: Integer
  
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true
  
  KINDS = %w[Pessoal Empresarial]
  
  class << self
    def kind_enum
      [ 
        [KINDS[0], 0], 
        [KINDS[1], 1]
      ]
    end
  end
end
