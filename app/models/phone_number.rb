class PhoneNumber < ActiveRecord::Base
  set_table_name "ThornhillPhone"
  belongs_to :address, :foreign_key =>"AddressID"
  validates_presence_of :PhoneType, :PhoneNumber
  validates_format_of :PhoneNumber, :with => /^\d{3}-\d{3}-\d{4}$/, :message => "Phone number is not valid (xxx-xxx-xxxx)"
end
