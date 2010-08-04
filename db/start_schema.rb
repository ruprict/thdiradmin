# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "ThornhillAddress", :force => true do |t|
    t.integer  "StreetNumber",                                  :null => false
    t.string   "StreetName",   :limit => 50,                    :null => false
    t.datetime "MoveInDate"
    t.boolean  "Unlisted",                   :default => false
  end

  create_table "ThornhillBlock", :id => false, :force => true do |t|
    t.string  "BlockCode",        :limit => 10, :null => false
    t.string  "BlockDescription", :limit => 50, :null => false
    t.integer "High",                           :null => false
    t.integer "Low",                            :null => false
  end

  create_table "ThornhillBlockAddress", :id => false, :force => true do |t|
    t.string  "BlockCode", :limit => 10, :null => false
    t.integer "AddressID",               :null => false
  end

  create_table "ThornhillBusiness", :force => true do |t|
    t.integer  "PersonID",                       :null => false
    t.string   "BusinessName",    :limit => 50,  :null => false
    t.string   "BusinessDesc",    :limit => 500, :null => false
    t.string   "BusinessType",    :limit => 50,  :null => false
    t.string   "BusinessEmail",   :limit => 100
    t.string   "BusinessWebsite", :limit => 100
    t.string   "BusinessPhone",   :limit => 25
    t.datetime "ctime"
    t.datetime "mtime"
    t.datetime "expiration"
    t.string   "class",           :limit => 32
    t.string   "listedName",      :limit => 50
  end

  create_table "ThornhillBusinessType", :id => false, :force => true do |t|
    t.string "TypeName", :limit => 50, :null => false
  end

  create_table "ThornhillChild", :id => false, :force => true do |t|
    t.integer "ParentID", :null => false
    t.integer "ChildID",  :null => false
  end

  create_table "ThornhillEmail", :force => true do |t|
    t.integer "PersonID",                   :null => false
    t.string  "EmailType",    :limit => 50, :null => false
    t.string  "EmailAddress", :limit => 50, :null => false
  end


  create_table "ThornhillOrganization", :id => false, :force => true do |t|
    t.string "OrgName", :limit => 50, :null => false
  end

  create_table "ThornhillParticipation", :force => true do |t|
    t.string  "OrgName",    :limit => 50,                     :null => false
    t.integer "PersonID",                                     :null => false
    t.string  "Title",      :limit => 50,                     :null => false
    t.boolean "IsBoard"
    t.boolean "IsChair",                   :default => false
    t.string  "EmailAlias", :limit => 100
  end

  create_table "ThornhillPerson", :force => true do |t|
    t.string   "FirstName",  :limit => 50, :null => false
    t.string   "LastName",   :limit => 50, :null => false
    t.integer  "AddressID",                :null => false
    t.datetime "Birthdate"
    t.integer  "SpouseID"
    t.integer  "inactive",   :limit => 2
    t.datetime "Created_On"
  end

  create_table "ThornhillPhone", :force => true do |t|
    t.integer "AddressID",                 :null => false
    t.string  "PhoneType",   :limit => 50, :null => false
    t.string  "PhoneNumber", :limit => 50, :null => false
  end

  create_table "thornhillSale", :force => true do |t|
    t.string  "Item",     :limit => 50,  :null => false
    t.string  "Category", :limit => 25,  :null => false
    t.string  "Price",    :limit => 20
    t.string  "Name",     :limit => 50
    t.string  "Phone",    :limit => 20
    t.string  "Email",    :limit => 100
    t.integer "ImageID"
  end

end
