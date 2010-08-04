class Email < ActiveRecord::Base
  set_table_name "ThornhillEmail"
  belongs_to :person, :foreign_key=>"PersonID"
  validates_presence_of :EmailAddress, :EmailType
end
