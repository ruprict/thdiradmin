class Address < ActiveRecord::Base
  set_table_name "ThornhillAddress"
  has_many :people, :foreign_key=>"AddressID"
  has_many :phone_numbers, :foreign_key=>"AddressID"
end
