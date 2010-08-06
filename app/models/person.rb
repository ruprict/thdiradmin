class Person < ActiveRecord::Base
  set_table_name "ThornhillPerson"
  belongs_to :address, :foreign_key => "AddressID"
  has_many :emails, :foreign_key=>"PersonID"
  has_and_belongs_to_many :children, :class_name => "Person",
  :join_table => "ThornhillChild", :association_foreign_key => "ChildID", :foreign_key => "ParentID"

  
  def full_name
    [self.FirstName, self.LastName].join(' ')
  end
end
