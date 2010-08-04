class Person < ActiveRecord::Base
  set_table_name "ThornhillPerson"
  belongs_to :address, :foreign_key => "AddressID"
  has_many :emails, :foreign_key=>"PersonID"
  def full_name
    [self.FirstName, self.LastName].join(' ')
  end
end
