class Contact
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :kind, type: Integer
  
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true
  
  validates :name, :email, :kind, presence: true
  validates :email, :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  
  KINDS = %w[Pessoal Empresarial]
  
  class << self
    def kind_enum
      [ 
        [KINDS[0], 0], 
        [KINDS[1], 1]
      ]
    end
    
    def list(params)
      params.has_key?(:kind) ? Contact.where(kind: params[:kind]) : Contact.all
    end
    
    def count_kind(value)
      where(kind: value).count
    end

  end
end
