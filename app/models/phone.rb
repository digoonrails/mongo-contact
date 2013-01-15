class Phone
  include Mongoid::Document
  field :ddd, type: String
  field :number, type: String
  
  belongs_to :contact
  
  def phone_with_ddd
    "(#{self.ddd}) #{self.number}"
  end
  
end