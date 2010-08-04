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

  create_table "Affiliates", :primary_key => "AffiliateId", :force => true do |t|
    t.integer  "VendorId"
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.float    "CPC",          :limit => nil, :null => false
    t.integer  "Clicks",                      :null => false
    t.float    "CPA",          :limit => nil, :null => false
    t.integer  "Acquisitions",                :null => false
  end

  create_table "Announcements", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                      :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.string   "Title",         :limit => 150
    t.string   "URL",           :limit => 150
    t.datetime "ExpireDate"
    t.string   "Description",   :limit => 2000
    t.integer  "ViewOrder"
  end

  add_index "Announcements", ["ModuleID"], :name => "IX_Announcements"

  create_table "AnonymousUsers", :id => false, :force => true do |t|
    t.string   "UserID",         :limit => 36, :null => false
    t.integer  "PortalID",                     :null => false
    t.integer  "TabID",                        :null => false
    t.datetime "CreationDate",                 :null => false
    t.datetime "LastActiveDate",               :null => false
  end

  create_table "Assemblies", :primary_key => "AssemblyID", :force => true do |t|
    t.integer "PackageID",                   :null => false
    t.string  "AssemblyName", :limit => 250, :null => false
    t.string  "Version",      :limit => 20,  :null => false
  end

  create_table "Authentication", :primary_key => "AuthenticationID", :force => true do |t|
    t.integer "PackageID",                         :default => -1,    :null => false
    t.string  "AuthenticationType", :limit => 100,                    :null => false
    t.boolean "IsEnabled",                         :default => false, :null => false
    t.string  "SettingsControlSrc", :limit => 250,                    :null => false
    t.string  "LoginControlSrc",    :limit => 250,                    :null => false
    t.string  "LogoffControlSrc",   :limit => 250,                    :null => false
  end

  create_table "Banners", :primary_key => "BannerId", :force => true do |t|
    t.integer  "VendorId",                                        :null => false
    t.string   "ImageFile",     :limit => 100
    t.string   "BannerName",    :limit => 100,                    :null => false
    t.integer  "Impressions",                                     :null => false
    t.float    "CPM",           :limit => nil,                    :null => false
    t.integer  "Views",                         :default => 0,    :null => false
    t.integer  "ClickThroughs",                 :default => 0,    :null => false
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.string   "CreatedByUser", :limit => 100,                    :null => false
    t.datetime "CreatedDate",                                     :null => false
    t.integer  "BannerTypeId"
    t.string   "Description",   :limit => 2000
    t.string   "GroupName",     :limit => 100
    t.boolean  "Criteria",                      :default => true, :null => false
    t.string   "URL"
    t.integer  "Width",                         :default => 0,    :null => false
    t.integer  "Height",                        :default => 0,    :null => false
  end

  add_index "Banners", ["BannerTypeId"], :name => "IX_Banners"
  add_index "Banners", ["VendorId"], :name => "IX_Banners_1"

  create_table "Blog_Blogs", :primary_key => "BlogID", :force => true do |t|
    t.integer  "PortalID",                                              :null => false
    t.integer  "UserID",                                                :null => false
    t.string   "Title",                                                 :null => false
    t.string   "Description",           :limit => 1024
    t.boolean  "Public",                                                :null => false
    t.boolean  "AllowComments",                                         :null => false
    t.boolean  "AllowAnonymous",                                        :null => false
    t.datetime "LastEntry"
    t.datetime "Created",                                               :null => false
    t.boolean  "ShowFullName",                                          :null => false
    t.string   "DateFormat",            :limit => 50,                   :null => false
    t.string   "Culture",               :limit => 10
    t.integer  "TimeZone",                                              :null => false
    t.integer  "ParentBlogID",                          :default => -1
    t.boolean  "Syndicated",                                            :null => false
    t.boolean  "SyndicateIndependant",                                  :null => false
    t.string   "SyndicationURL",        :limit => 1024
    t.string   "SyndicationEmail"
    t.boolean  "EmailNotification"
    t.boolean  "AllowTrackbacks"
    t.boolean  "AutoTrackback"
    t.boolean  "MustApproveComments"
    t.boolean  "MustApproveAnonymous"
    t.boolean  "MustApproveTrackbacks"
  end

  add_index "Blog_Blogs", ["PortalID"], :name => "IX_Blog_Blogs_PortalID"
  add_index "Blog_Blogs", ["UserID"], :name => "IX_Blog_Blogs_UserID"

  create_table "Blog_Comments", :primary_key => "CommentID", :force => true do |t|
    t.integer  "EntryID",                 :null => false
    t.integer  "UserID"
    t.text     "Comment",                 :null => false
    t.datetime "AddedDate",               :null => false
    t.string   "Title",                   :null => false
    t.boolean  "Approved"
    t.string   "Author",    :limit => 50
  end

  add_index "Blog_Comments", ["EntryID"], :name => "IX_Blog_Comments_EntryID"

  create_table "Blog_Entries", :primary_key => "EntryID", :force => true do |t|
    t.integer  "BlogID",                           :null => false
    t.string   "Title",                            :null => false
    t.text     "Entry",                            :null => false
    t.datetime "AddedDate",                        :null => false
    t.boolean  "Published",                        :null => false
    t.string   "Description",      :limit => 1024
    t.boolean  "AllowComments"
    t.boolean  "DisplayCopyright",                 :null => false
    t.string   "Copyright"
    t.string   "PermaLink",        :limit => 1024
  end

  add_index "Blog_Entries", ["AddedDate"], :name => "IX_Blog_Entries_AddedDate"
  add_index "Blog_Entries", ["BlogID"], :name => "IX_Blog_Entries_BlogID"

  create_table "Blog_Settings", :id => false, :force => true do |t|
    t.integer "PortalID",                 :null => false
    t.string  "Key",      :limit => 50,   :null => false
    t.string  "Value",    :limit => 1024, :null => false
    t.integer "TabID",                    :null => false
  end

  create_table "Calendar", :primary_key => "EventID", :force => true do |t|
    t.integer  "ModuleID"
    t.datetime "EventDateBegin"
    t.datetime "EventDateEnd"
    t.datetime "EventTimeBegin"
    t.integer  "Duration"
    t.string   "EventName",               :limit => 100
    t.text     "EventDesc"
    t.integer  "Importance"
    t.string   "RepeatType",              :limit => 10
    t.string   "Every",                   :limit => 10
    t.string   "Period",                  :limit => 50
    t.string   "Reminder",                :limit => 100
    t.string   "Notify",                  :limit => 2048
    t.string   "CreatedBy",               :limit => 100
    t.datetime "CreatedDate"
    t.boolean  "Approved"
    t.integer  "PortalID"
    t.boolean  "Signups"
    t.integer  "MaxEnrollment"
    t.string   "EnrollRoleID",            :limit => 50
    t.decimal  "EnrollFee"
    t.string   "EnrollType",              :limit => 10
    t.string   "PayPalAccount",           :limit => 100
    t.string   "PayPalPassword",          :limit => 100
    t.boolean  "Cancelled"
    t.string   "ImageURL",                :limit => 100
    t.string   "ImageType",               :limit => 1
    t.integer  "ImageWidth"
    t.integer  "ImageHeight"
    t.boolean  "ImageDisplay"
    t.integer  "Location"
    t.integer  "Category"
    t.integer  "TimezoneOffset"
    t.boolean  "SendReminder"
    t.integer  "ReminderTime"
    t.string   "ReminderTimeMeasurement", :limit => 2
    t.string   "ReminderFrom",            :limit => 100
    t.boolean  "SearchSubmitted"
  end

  add_index "Calendar", ["EventDateBegin"], :name => "IX_Calendar"
  add_index "Calendar", ["EventDateEnd"], :name => "IX_Calendar_1"
  add_index "Calendar", ["EventDateEnd"], :name => "IX_Calendar_3"
  add_index "Calendar", ["ModuleID"], :name => "IX_Calendar_2"

  create_table "CalendarCategory", :primary_key => "Category", :force => true do |t|
    t.integer "PortalID",                   :null => false
    t.string  "CategoryName", :limit => 50, :null => false
    t.string  "Color",        :limit => 10
  end

  add_index "CalendarCategory", ["CategoryName"], :name => "IX_CalendarCategory"

  create_table "CalendarLocation", :primary_key => "Location", :force => true do |t|
    t.integer "PortalID",                   :null => false
    t.string  "LocationName", :limit => 50, :null => false
    t.string  "MapURL"
  end

  add_index "CalendarLocation", ["LocationName"], :name => "IX_CalendarLocation"

  create_table "CalendarMaster", :primary_key => "MasterID", :force => true do |t|
    t.integer "ModuleID"
    t.integer "SubCalendarID"
  end

  add_index "CalendarMaster", ["MasterID", "SubCalendarID"], :name => "IX_CalendarMaster", :unique => true
  add_index "CalendarMaster", ["ModuleID"], :name => "IX_CalendarMaster_1"

  create_table "CalendarNotification", :primary_key => "NotificationID", :force => true do |t|
    t.integer  "EventID",          :null => false
    t.datetime "NotifyByDateTime", :null => false
  end

  add_index "CalendarNotification", ["EventID", "NotifyByDateTime"], :name => "IX_CalendarNotification"
  add_index "CalendarNotification", ["NotifyByDateTime"], :name => "IX_CalendarNotification_1"

  create_table "CalendarPPErrorLog", :primary_key => "PayPalID", :force => true do |t|
    t.integer  "SignupID"
    t.datetime "CreateDate"
    t.string   "PayPalStatus",        :limit => 50
    t.string   "PayPalReason",        :limit => 100
    t.string   "PayPalTransID",       :limit => 50
    t.string   "PayPalPayerID",       :limit => 50
    t.string   "PayPalPayerStatus",   :limit => 50
    t.string   "PayPalRecieverEmail", :limit => 100
    t.string   "PayPalUserEmail",     :limit => 100
    t.string   "PayPalPayerEmail",    :limit => 100
    t.string   "PayPalFirstName",     :limit => 50
    t.string   "PayPalLastName",      :limit => 50
    t.string   "PayPalAddress",       :limit => 100
    t.string   "PayPalCity",          :limit => 50
    t.string   "PayPalState",         :limit => 25
    t.string   "PayPalZip",           :limit => 25
    t.string   "PayPalCountry",       :limit => 25
    t.string   "PayPalCurrency",      :limit => 25
    t.datetime "PayPalPaymentDate"
    t.decimal  "PayPalAmount"
    t.decimal  "PayPalFee"
  end

  add_index "CalendarPPErrorLog", ["CreateDate"], :name => "IX_CalendarPPErrorLog"

  create_table "CalendarSignups", :primary_key => "SignupID", :force => true do |t|
    t.integer  "ModuleID",                           :null => false
    t.integer  "EventID",                            :null => false
    t.integer  "UserID",                             :null => false
    t.datetime "CreateDate"
    t.boolean  "Approved"
    t.string   "PayPalStatus",        :limit => 50
    t.string   "PayPalReason",        :limit => 100
    t.string   "PayPalTransID",       :limit => 50
    t.string   "PayPalPayerID",       :limit => 50
    t.string   "PayPalPayerStatus",   :limit => 50
    t.string   "PayPalRecieverEmail", :limit => 100
    t.string   "PayPalUserEmail",     :limit => 100
    t.string   "PayPalPayerEmail",    :limit => 100
    t.string   "PayPalFirstName",     :limit => 50
    t.string   "PayPalLastName",      :limit => 50
    t.string   "PayPalAddress",       :limit => 100
    t.string   "PayPalCity",          :limit => 50
    t.string   "PayPalState",         :limit => 25
    t.string   "PayPalZip",           :limit => 25
    t.string   "PayPalCountry",       :limit => 25
    t.string   "PayPalCurrency",      :limit => 25
    t.datetime "PayPalPaymentDate"
    t.decimal  "PayPalAmount"
    t.decimal  "PayPalFee"
  end

  add_index "CalendarSignups", ["ModuleID", "EventID", "UserID"], :name => "IX_CalendarSignups", :unique => true
  add_index "CalendarSignups", ["PayPalTransID"], :name => "IX_CalendarSignups_1"

  create_table "Classification", :primary_key => "ClassificationId", :force => true do |t|
    t.string  "ClassificationName", :limit => 200, :null => false
    t.integer "ParentId"
  end

  add_index "Classification", ["ParentId"], :name => "IX_Classification"

  create_table "Contacts", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                     :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.string   "Name",          :limit => 50
    t.string   "Role",          :limit => 100
    t.string   "Email",         :limit => 100
    t.string   "Contact1",      :limit => 250
    t.string   "Contact2",      :limit => 250
  end

  add_index "Contacts", ["ModuleID"], :name => "IX_Contacts"

  create_table "Dashboard_Controls", :primary_key => "DashboardControlID", :force => true do |t|
    t.string  "DashboardControlKey",            :limit => 50,                 :null => false
    t.boolean "IsEnabled",                                                    :null => false
    t.string  "DashboardControlSrc",            :limit => 250,                :null => false
    t.string  "DashboardControlLocalResources", :limit => 250,                :null => false
    t.string  "ControllerClass",                :limit => 250
    t.integer "ViewOrder",                                     :default => 0, :null => false
  end

  create_table "DesktopModules", :primary_key => "DesktopModuleID", :force => true do |t|
    t.string  "FriendlyName",            :limit => 128,                 :null => false
    t.string  "Description",             :limit => 2000
    t.string  "Version",                 :limit => 8
    t.boolean "IsPremium",                                              :null => false
    t.boolean "IsAdmin",                                                :null => false
    t.string  "BusinessControllerClass", :limit => 200
    t.string  "FolderName",              :limit => 128,                 :null => false
    t.string  "ModuleName",              :limit => 128,                 :null => false
    t.integer "SupportedFeatures",                       :default => 0, :null => false
    t.string  "CompatibleVersions",      :limit => 500
    t.string  "Dependencies",            :limit => 400
    t.string  "Permissions",             :limit => 400
  end

  add_index "DesktopModules", ["FriendlyName"], :name => "IX_DesktopModules_FriendlyName"
  add_index "DesktopModules", ["ModuleName"], :name => "IX_DesktopModules_ModuleName", :unique => true

  create_table "Discussion", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                      :null => false
    t.string   "Title",         :limit => 100
    t.datetime "CreatedDate"
    t.string   "Body",          :limit => 3000
    t.string   "DisplayOrder",  :limit => 750
    t.string   "CreatedByUser", :limit => 100
  end

  add_index "Discussion", ["ModuleID"], :name => "IX_Discussion"

  create_table "Documents", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                     :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.string   "URL",           :limit => 250
    t.string   "Title",         :limit => 150
    t.string   "Category",      :limit => 50
  end

  add_index "Documents", ["ModuleID"], :name => "IX_Documents"

  create_table "EventLog", :id => false, :force => true do |t|
    t.string   "LogGUID",                :limit => 36,  :null => false
    t.string   "LogTypeKey",             :limit => 35,  :null => false
    t.integer  "LogConfigID"
    t.integer  "LogUserID"
    t.string   "LogUserName",            :limit => 50
    t.integer  "LogPortalID"
    t.string   "LogPortalName",          :limit => 100
    t.datetime "LogCreateDate",                         :null => false
    t.string   "LogServerName",          :limit => 50,  :null => false
    t.text     "LogProperties",                         :null => false
    t.boolean  "LogNotificationPending"
  end

  add_index "EventLog", ["LogConfigID", "LogTypeKey", "LogCreateDate"], :name => "IX_EventLog"

  create_table "EventLogConfig", :primary_key => "ID", :force => true do |t|
    t.string  "LogTypeKey",                    :limit => 35
    t.integer "LogTypePortalID"
    t.boolean "LoggingIsActive",                             :null => false
    t.integer "KeepMostRecent",                              :null => false
    t.boolean "EmailNotificationIsActive",                   :null => false
    t.integer "NotificationThreshold"
    t.integer "NotificationThresholdTime"
    t.integer "NotificationThresholdTimeType"
    t.string  "MailFromAddress",               :limit => 50, :null => false
    t.string  "MailToAddress",                 :limit => 50, :null => false
  end

  add_index "EventLogConfig", ["LogTypeKey", "LogTypePortalID"], :name => "IX_LogTypeKey_LogTypePortalID", :unique => true

  create_table "EventLogTypes", :id => false, :force => true do |t|
    t.string "LogTypeKey",          :limit => 35,  :null => false
    t.string "LogTypeFriendlyName", :limit => 50,  :null => false
    t.string "LogTypeDescription",  :limit => 128, :null => false
    t.string "LogTypeOwner",        :limit => 100, :null => false
    t.string "LogTypeCSSClass",     :limit => 40,  :null => false
  end

  create_table "EventQueue", :primary_key => "EventMessageID", :force => true do |t|
    t.string   "EventName",        :limit => 100,                    :null => false
    t.integer  "Priority",                                           :null => false
    t.string   "ProcessorType",    :limit => 250,                    :null => false
    t.string   "ProcessorCommand", :limit => 250,                    :null => false
    t.string   "Body",             :limit => 250,                    :null => false
    t.string   "Sender",           :limit => 250,                    :null => false
    t.string   "Subscriber",       :limit => 100,                    :null => false
    t.string   "AuthorizedRoles",  :limit => 250,                    :null => false
    t.string   "ExceptionMessage", :limit => 250,                    :null => false
    t.datetime "SentDate",                                           :null => false
    t.datetime "ExpirationDate",                                     :null => false
    t.text     "Attributes",                                         :null => false
    t.boolean  "IsComplete",                      :default => false, :null => false
  end

  create_table "Events", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                      :null => false
    t.string   "Description",   :limit => 2000, :null => false
    t.datetime "DateTime",                      :null => false
    t.string   "Title",         :limit => 100,  :null => false
    t.datetime "ExpireDate"
    t.string   "CreatedByUser", :limit => 200,  :null => false
    t.datetime "CreatedDate",                   :null => false
    t.integer  "Every"
    t.string   "Period",        :limit => 1
    t.string   "IconFile",      :limit => 256
    t.string   "AltText",       :limit => 50
  end

  add_index "Events", ["ModuleID"], :name => "IX_Events"

  create_table "FAQs", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                     :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.text     "Question"
    t.text     "Answer"
  end

  add_index "FAQs", ["ModuleID"], :name => "IX_FAQs"

  create_table "Files", :primary_key => "FileId", :force => true do |t|
    t.integer "PortalId"
    t.string  "FileName",    :limit => 100, :null => false
    t.string  "Extension",   :limit => 100, :null => false
    t.integer "Size",                       :null => false
    t.integer "Width"
    t.integer "Height"
    t.string  "ContentType", :limit => 200, :null => false
    t.string  "Folder",      :limit => 200
    t.integer "FolderID",                   :null => false
    t.binary  "Content"
  end

  add_index "Files", ["FolderID", "FileName"], :name => "IX_FileName", :unique => true
  add_index "Files", ["PortalId"], :name => "IX_Files"

  create_table "FolderPermission", :primary_key => "FolderPermissionID", :force => true do |t|
    t.integer "FolderID",     :null => false
    t.integer "PermissionID", :null => false
    t.boolean "AllowAccess",  :null => false
    t.integer "RoleID"
    t.integer "UserID"
  end

  add_index "FolderPermission", ["FolderID", "PermissionID", "RoleID", "UserID"], :name => "IX_FolderPermission", :unique => true
  add_index "FolderPermission", ["FolderID"], :name => "IX_FolderPermission_Modules"
  add_index "FolderPermission", ["PermissionID"], :name => "IX_FolderPermission_Permission"
  add_index "FolderPermission", ["RoleID"], :name => "IX_FolderPermission_Roles"
  add_index "FolderPermission", ["UserID"], :name => "IX_FolderPermission_Users"

  create_table "Folders", :primary_key => "FolderID", :force => true do |t|
    t.integer  "PortalID"
    t.string   "FolderPath",      :limit => 300,                    :null => false
    t.integer  "StorageLocation",                :default => 0,     :null => false
    t.boolean  "IsProtected",                    :default => false, :null => false
    t.boolean  "IsCached",                       :default => false, :null => false
    t.datetime "LastUpdated"
  end

  add_index "Folders", ["PortalID", "FolderPath"], :name => "IX_FolderPath", :unique => true

  create_table "HostSettings", :id => false, :force => true do |t|
    t.string  "SettingName",     :limit => 50,                     :null => false
    t.string  "SettingValue",    :limit => 256,                    :null => false
    t.boolean "SettingIsSecure",                :default => false, :null => false
  end

  create_table "HtmlText", :id => false, :force => true do |t|
    t.integer  "ModuleID",       :null => false
    t.text     "DesktopHtml",    :null => false
    t.text     "DesktopSummary"
    t.integer  "CreatedByUser"
    t.datetime "CreatedDate"
  end

  create_table "Links", :primary_key => "ItemID", :force => true do |t|
    t.integer  "ModuleID",                      :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.string   "Title",         :limit => 100
    t.string   "Url",           :limit => 250
    t.integer  "ViewOrder"
    t.string   "Description",   :limit => 2000
  end

  add_index "Links", ["ModuleID"], :name => "IX_Links"

  create_table "Lists", :primary_key => "EntryID", :force => true do |t|
    t.string  "ListName",     :limit => 50,                     :null => false
    t.string  "Value",        :limit => 100,                    :null => false
    t.string  "Text",         :limit => 150,                    :null => false
    t.integer "ParentID",                    :default => 0,     :null => false
    t.integer "Level",                       :default => 0,     :null => false
    t.integer "SortOrder",                   :default => 0,     :null => false
    t.integer "DefinitionID",                :default => 0,     :null => false
    t.string  "Description",  :limit => 500
    t.integer "PortalID",                    :default => -1,    :null => false
    t.boolean "SystemList",                  :default => false, :null => false
  end

  create_table "ModuleControls", :primary_key => "ModuleControlID", :force => true do |t|
    t.integer "ModuleDefID"
    t.string  "ControlKey",               :limit => 50
    t.string  "ControlTitle",             :limit => 50
    t.string  "ControlSrc",               :limit => 256
    t.string  "IconFile",                 :limit => 100
    t.integer "ControlType",                                                :null => false
    t.integer "ViewOrder"
    t.string  "HelpUrl",                  :limit => 200
    t.boolean "SupportsPartialRendering",                :default => false, :null => false
  end

  add_index "ModuleControls", ["ModuleDefID", "ControlKey", "ControlSrc"], :name => "IX_ModuleControls", :unique => true

  create_table "ModuleDefinitions", :primary_key => "ModuleDefID", :force => true do |t|
    t.string  "FriendlyName",     :limit => 128,                :null => false
    t.integer "DesktopModuleID",                                :null => false
    t.integer "DefaultCacheTime",                :default => 0, :null => false
  end

  add_index "ModuleDefinitions", ["DesktopModuleID"], :name => "IX_ModuleDefinitions_1"
  add_index "ModuleDefinitions", ["FriendlyName"], :name => "IX_ModuleDefinitions", :unique => true

  create_table "ModulePermission", :primary_key => "ModulePermissionID", :force => true do |t|
    t.integer "ModuleID",     :null => false
    t.integer "PermissionID", :null => false
    t.boolean "AllowAccess",  :null => false
    t.integer "RoleID"
    t.integer "UserID"
  end

  add_index "ModulePermission", ["ModuleID", "PermissionID", "RoleID", "UserID"], :name => "IX_ModulePermission", :unique => true
  add_index "ModulePermission", ["ModuleID"], :name => "IX_ModulePermission_Modules"
  add_index "ModulePermission", ["PermissionID"], :name => "IX_ModulePermission_Permission"
  add_index "ModulePermission", ["RoleID"], :name => "IX_ModulePermission_Roles"
  add_index "ModulePermission", ["UserID"], :name => "IX_ModulePermission_Users"

  create_table "ModuleSettings", :id => false, :force => true do |t|
    t.integer "ModuleID",                     :null => false
    t.string  "SettingName",  :limit => 50,   :null => false
    t.string  "SettingValue", :limit => 2000, :null => false
  end

  create_table "Modules", :primary_key => "ModuleID", :force => true do |t|
    t.integer  "ModuleDefID",                                              :null => false
    t.string   "ModuleTitle",            :limit => 256
    t.boolean  "AllTabs",                               :default => false, :null => false
    t.boolean  "IsDeleted",                             :default => false, :null => false
    t.boolean  "InheritViewPermissions"
    t.text     "Header"
    t.text     "Footer"
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.integer  "PortalID"
  end

  add_index "Modules", ["ModuleDefID"], :name => "IX_Modules"

  create_table "PackageTypes", :id => false, :force => true do |t|
    t.string  "PackageType",         :limit => 100, :null => false
    t.string  "Description",         :limit => 500, :null => false
    t.integer "SecurityAccessLevel",                :null => false
  end

  create_table "Packages", :primary_key => "PackageID", :force => true do |t|
    t.string "Name",         :limit => 50,   :null => false
    t.string "FriendlyName", :limit => 250,  :null => false
    t.string "Description",  :limit => 2000, :null => false
    t.string "PackageType",  :limit => 50,   :null => false
    t.string "Version",      :limit => 50,   :null => false
    t.text   "License",                      :null => false
    t.text   "Manifest",                     :null => false
  end

  add_index "Packages", ["Name"], :name => "IX_Packages", :unique => true

  create_table "Permission", :primary_key => "PermissionID", :force => true do |t|
    t.string  "PermissionCode", :limit => 50, :null => false
    t.integer "ModuleDefID",                  :null => false
    t.string  "PermissionKey",  :limit => 50, :null => false
    t.string  "PermissionName", :limit => 50, :null => false
  end

  add_index "Permission", ["PermissionCode", "ModuleDefID", "PermissionKey"], :name => "IX_Permission", :unique => true

  create_table "PortalAlias", :primary_key => "PortalAliasID", :force => true do |t|
    t.integer "PortalID",                 :null => false
    t.string  "HTTPAlias", :limit => 200
  end

  add_index "PortalAlias", ["HTTPAlias"], :name => "IX_PortalAlias", :unique => true

  create_table "PortalDesktopModules", :primary_key => "PortalDesktopModuleID", :force => true do |t|
    t.integer "PortalID",        :null => false
    t.integer "DesktopModuleID", :null => false
  end

  add_index "PortalDesktopModules", ["PortalID", "DesktopModuleID"], :name => "IX_PortalDesktopModules", :unique => true

  create_table "Portals", :primary_key => "PortalID", :force => true do |t|
    t.string   "PortalName",          :limit => 128,                       :null => false
    t.string   "LogoFile",            :limit => 50
    t.string   "FooterText",          :limit => 100
    t.datetime "ExpiryDate"
    t.integer  "UserRegistration",                   :default => 0,        :null => false
    t.integer  "BannerAdvertising",                  :default => 0,        :null => false
    t.integer  "AdministratorId"
    t.string   "Currency",            :limit => 3
    t.decimal  "HostFee",                            :default => 0.0,      :null => false
    t.integer  "HostSpace",                          :default => 0,        :null => false
    t.integer  "AdministratorRoleId"
    t.integer  "RegisteredRoleId"
    t.string   "Description",         :limit => 500
    t.string   "KeyWords",            :limit => 500
    t.string   "BackgroundFile",      :limit => 50
    t.string   "GUID",                :limit => nil, :default => "newid(", :null => false
    t.string   "PaymentProcessor",    :limit => 50
    t.string   "ProcessorUserId",     :limit => 50
    t.string   "ProcessorPassword",   :limit => 50
    t.integer  "SiteLogHistory"
    t.integer  "HomeTabId"
    t.integer  "LoginTabId"
    t.integer  "UserTabId"
    t.string   "DefaultLanguage",     :limit => 10,  :default => "en-US",  :null => false
    t.integer  "TimezoneOffset",                     :default => -8,       :null => false
    t.integer  "AdminTabId"
    t.string   "HomeDirectory",       :limit => 100, :default => "",       :null => false
    t.integer  "SplashTabId"
    t.integer  "PageQuota",                          :default => 0,        :null => false
    t.integer  "UserQuota",                          :default => 0,        :null => false
  end

  create_table "Profile", :primary_key => "ProfileId", :force => true do |t|
    t.integer  "UserId",      :null => false
    t.integer  "PortalId",    :null => false
    t.text     "ProfileData", :null => false
    t.datetime "CreatedDate", :null => false
  end

  add_index "Profile", ["UserId", "PortalId"], :name => "IX_Profile", :unique => true

  create_table "ProfilePropertyDefinition", :primary_key => "PropertyDefinitionID", :force => true do |t|
    t.integer "PortalID"
    t.integer "ModuleDefID"
    t.boolean "Deleted",                                             :null => false
    t.integer "DataType",                                            :null => false
    t.text    "DefaultValue"
    t.string  "PropertyCategory",     :limit => 50,                  :null => false
    t.string  "PropertyName",         :limit => 50,                  :null => false
    t.integer "Length",                               :default => 0, :null => false
    t.boolean "Required",                                            :null => false
    t.string  "ValidationExpression", :limit => 2000
    t.integer "ViewOrder",                                           :null => false
    t.boolean "Visible",                                             :null => false
  end

  add_index "ProfilePropertyDefinition", ["PortalID", "ModuleDefID", "PropertyName"], :name => "IX_ProfilePropertyDefinition", :unique => true
  add_index "ProfilePropertyDefinition", ["PropertyName"], :name => "IX_ProfilePropertyDefinition_PropertyName"

  create_table "RoleGroups", :primary_key => "RoleGroupID", :force => true do |t|
    t.integer "PortalID",                      :null => false
    t.string  "RoleGroupName", :limit => 50,   :null => false
    t.string  "Description",   :limit => 1000
  end

  add_index "RoleGroups", ["PortalID", "RoleGroupName"], :name => "IX_RoleGroupName", :unique => true

  create_table "Roles", :primary_key => "RoleID", :force => true do |t|
    t.integer "PortalID",                                            :null => false
    t.string  "RoleName",         :limit => 50,                      :null => false
    t.string  "Description",      :limit => 1000
    t.decimal "ServiceFee",                       :default => 0.0
    t.string  "BillingFrequency", :limit => 1
    t.integer "TrialPeriod"
    t.string  "TrialFrequency",   :limit => 1
    t.integer "BillingPeriod"
    t.decimal "TrialFee"
    t.boolean "IsPublic",                         :default => false, :null => false
    t.boolean "AutoAssignment",                   :default => false, :null => false
    t.integer "RoleGroupID"
    t.string  "RSVPCode",         :limit => 50
    t.string  "IconFile",         :limit => 100
  end

  add_index "Roles", ["BillingFrequency"], :name => "IX_Roles"
  add_index "Roles", ["PortalID", "RoleName"], :name => "IX_RoleName", :unique => true

  create_table "Schedule", :primary_key => "ScheduleID", :force => true do |t|
    t.string  "TypeFullName",              :limit => 200, :null => false
    t.integer "TimeLapse",                                :null => false
    t.string  "TimeLapseMeasurement",      :limit => 2,   :null => false
    t.integer "RetryTimeLapse",                           :null => false
    t.string  "RetryTimeLapseMeasurement", :limit => 2,   :null => false
    t.integer "RetainHistoryNum",                         :null => false
    t.string  "AttachToEvent",             :limit => 50,  :null => false
    t.boolean "CatchUpEnabled",                           :null => false
    t.boolean "Enabled",                                  :null => false
    t.string  "ObjectDependencies",        :limit => 300, :null => false
    t.string  "Servers",                   :limit => 150
  end

  create_table "ScheduleHistory", :primary_key => "ScheduleHistoryID", :force => true do |t|
    t.integer  "ScheduleID",                :null => false
    t.datetime "StartDate",                 :null => false
    t.datetime "EndDate"
    t.boolean  "Succeeded"
    t.text     "LogNotes"
    t.datetime "NextStart"
    t.string   "Server",     :limit => 150
  end

  add_index "ScheduleHistory", ["ScheduleID", "NextStart"], :name => "IX_ScheduleHistory_NextStart"
  add_index "ScheduleHistory", ["ScheduleID", "StartDate"], :name => "IX_ScheduleHistory_StartDate"

  create_table "ScheduleItemSettings", :id => false, :force => true do |t|
    t.integer "ScheduleID",                  :null => false
    t.string  "SettingName",  :limit => 50,  :null => false
    t.string  "SettingValue", :limit => 256, :null => false
  end

  create_table "SearchCommonWords", :primary_key => "CommonWordID", :force => true do |t|
    t.string "CommonWord",               :null => false
    t.string "Locale",     :limit => 10
  end

  create_table "SearchIndexer", :primary_key => "SearchIndexerID", :force => true do |t|
    t.string "SearchIndexerAssemblyQualifiedName", :limit => 200, :null => false
  end

  create_table "SearchItem", :primary_key => "SearchItemID", :force => true do |t|
    t.string   "Title",       :limit => 200,  :null => false
    t.string   "Description", :limit => 2000, :null => false
    t.integer  "Author"
    t.datetime "PubDate",                     :null => false
    t.integer  "ModuleId",                    :null => false
    t.string   "SearchKey",   :limit => 100,  :null => false
    t.string   "Guid",        :limit => 200
    t.integer  "HitCount"
    t.integer  "ImageFileId"
  end

  add_index "SearchItem", ["ModuleId", "SearchKey"], :name => "IX_SearchItem", :unique => true

  create_table "SearchItemWord", :primary_key => "SearchItemWordID", :force => true do |t|
    t.integer "SearchItemID",  :null => false
    t.integer "SearchWordsID", :null => false
    t.integer "Occurrences",   :null => false
  end

  add_index "SearchItemWord", ["SearchItemID", "SearchWordsID"], :name => "IX_SearchItemWord", :unique => true

  create_table "SearchItemWordPosition", :primary_key => "SearchItemWordPositionID", :force => true do |t|
    t.integer "SearchItemWordID", :null => false
    t.integer "ContentPosition",  :null => false
  end

  create_table "SearchWord", :primary_key => "SearchWordsID", :force => true do |t|
    t.string  "Word",     :limit => 100, :null => false
    t.boolean "IsCommon"
    t.integer "HitCount",                :null => false
  end

  add_index "SearchWord", ["Word"], :name => "IX_SearchWord", :unique => true

  create_table "Servers", :primary_key => "ServerID", :force => true do |t|
    t.string   "ServerName",       :limit => 50, :null => false
    t.datetime "CreatedDate",                    :null => false
    t.datetime "LastActivityDate",               :null => false
  end

  create_table "SiteLog", :primary_key => "SiteLogId", :force => true do |t|
    t.datetime "DateTime",        :null => false
    t.integer  "PortalId",        :null => false
    t.integer  "UserId"
    t.string   "Referrer"
    t.string   "Url"
    t.string   "UserAgent"
    t.string   "UserHostAddress"
    t.string   "UserHostName"
    t.integer  "TabId"
    t.integer  "AffiliateId"
  end

  add_index "SiteLog", ["PortalId"], :name => "IX_SiteLog"

  create_table "Skins", :primary_key => "SkinID", :force => true do |t|
    t.integer "PortalID"
    t.string  "SkinRoot", :limit => 50,  :null => false
    t.string  "SkinSrc",  :limit => 200, :null => false
    t.integer "SkinType",                :null => false
  end

  create_table "SurveyOptions", :primary_key => "SurveyOptionID", :force => true do |t|
    t.integer "SurveyID",                  :null => false
    t.integer "ViewOrder",                 :null => false
    t.string  "OptionName", :limit => 500, :null => false
    t.integer "Votes",                     :null => false
  end

  create_table "Surveys", :primary_key => "SurveyID", :force => true do |t|
    t.integer  "ModuleID",                     :null => false
    t.string   "Question",      :limit => 500, :null => false
    t.integer  "ViewOrder"
    t.string   "OptionType",    :limit => 1,   :null => false
    t.string   "CreatedByUser", :limit => 100, :null => false
    t.datetime "CreatedDate",                  :null => false
  end

  create_table "SystemMessages", :primary_key => "MessageID", :force => true do |t|
    t.integer "PortalID"
    t.string  "MessageName",  :limit => 50, :null => false
    t.text    "MessageValue",               :null => false
  end

  add_index "SystemMessages", ["MessageName", "PortalID"], :name => "IX_SystemMessages", :unique => true

  create_table "TabModuleSettings", :id => false, :force => true do |t|
    t.integer "TabModuleID",                  :null => false
    t.string  "SettingName",  :limit => 50,   :null => false
    t.string  "SettingValue", :limit => 2000, :null => false
  end

  create_table "TabModules", :primary_key => "TabModuleID", :force => true do |t|
    t.integer "TabID",                                             :null => false
    t.integer "ModuleID",                                          :null => false
    t.string  "PaneName",         :limit => 50,                    :null => false
    t.integer "ModuleOrder",                                       :null => false
    t.integer "CacheTime",                                         :null => false
    t.string  "Alignment",        :limit => 10
    t.string  "Color",            :limit => 20
    t.string  "Border",           :limit => 1
    t.string  "IconFile",         :limit => 100
    t.integer "Visibility",                                        :null => false
    t.string  "ContainerSrc",     :limit => 200
    t.boolean "DisplayTitle",                    :default => true, :null => false
    t.boolean "DisplayPrint",                    :default => true, :null => false
    t.boolean "DisplaySyndicate",                :default => true, :null => false
  end

  add_index "TabModules", ["TabID", "ModuleID"], :name => "IX_TabModules", :unique => true

  create_table "TabPermission", :primary_key => "TabPermissionID", :force => true do |t|
    t.integer "TabID",        :null => false
    t.integer "PermissionID", :null => false
    t.boolean "AllowAccess",  :null => false
    t.integer "RoleID"
    t.integer "UserID"
  end

  add_index "TabPermission", ["PermissionID"], :name => "IX_TabPermission_Permission"
  add_index "TabPermission", ["RoleID"], :name => "IX_TabPermission_Roles"
  add_index "TabPermission", ["TabID", "PermissionID", "RoleID", "UserID"], :name => "IX_TabPermission", :unique => true
  add_index "TabPermission", ["TabID"], :name => "IX_TabPermission_Tabs"
  add_index "TabPermission", ["UserID"], :name => "IX_TabPermission_Users"

  create_table "Tabs", :primary_key => "TabID", :force => true do |t|
    t.integer  "TabOrder",                       :default => 0,     :null => false
    t.integer  "PortalID"
    t.string   "TabName",         :limit => 50,                     :null => false
    t.boolean  "IsVisible",                      :default => true,  :null => false
    t.integer  "ParentId"
    t.integer  "Level",                          :default => 0,     :null => false
    t.string   "IconFile",        :limit => 100
    t.boolean  "DisableLink",                    :default => false, :null => false
    t.string   "Title",           :limit => 200
    t.string   "Description",     :limit => 500
    t.string   "KeyWords",        :limit => 500
    t.boolean  "IsDeleted",                      :default => false, :null => false
    t.string   "Url"
    t.string   "SkinSrc",         :limit => 200
    t.string   "ContainerSrc",    :limit => 200
    t.string   "TabPath"
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.integer  "RefreshInterval"
    t.string   "PageHeadText",    :limit => 500
    t.boolean  "IsSecure",                       :default => false, :null => false
  end

  add_index "Tabs", ["ParentId"], :name => "IX_Tabs_2"
  add_index "Tabs", ["PortalID"], :name => "IX_Tabs_1"

  create_table "ThornhillAddress", :force => true do |t|
    t.integer  "StreetNumber",                                  :null => false
    t.string   "StreetName",   :limit => 50,                    :null => false
    t.datetime "MoveInDate"
    t.boolean  "Unlisted",                   :default => false
  end

  create_table "ThornhillAdvertisers", :force => true do |t|
    t.string   "listedName",      :limit => 101
    t.string   "BusinessName",    :limit => 50,  :null => false
    t.string   "BusinessDesc",    :limit => 500, :null => false
    t.string   "BusinessType",    :limit => 50,  :null => false
    t.string   "BusinessEmail"
    t.string   "BusinessWebsite"
    t.string   "BusinessPhone",   :limit => 25
    t.datetime "start_date"
    t.datetime "expiration"
    t.string   "class",           :limit => 32
    t.datetime "ctime"
    t.datetime "mtime"
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

  create_table "ThornhillListServ", :force => true do |t|
    t.string "ListServName",        :limit => 50, :null => false
    t.string "ListServDescription"
  end

  create_table "ThornhillListServMembers", :id => false, :force => true do |t|
    t.integer "EmailID",                 :null => false
    t.integer "ListServID",              :null => false
    t.string  "Moderator",  :limit => 1
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

  create_table "ThornhillRoles", :force => true do |t|
    t.string   "organization", :limit => 20, :null => false
    t.string   "roleName",     :limit => 20, :null => false
    t.string   "description",  :limit => 50
    t.datetime "mtime",                      :null => false
    t.datetime "ctime",                      :null => false
    t.string   "committee",    :limit => 50
  end

  create_table "UrlLog", :primary_key => "UrlLogID", :force => true do |t|
    t.integer  "UrlTrackingID", :null => false
    t.datetime "ClickDate",     :null => false
    t.integer  "UserID"
  end

  create_table "UrlTracking", :primary_key => "UrlTrackingID", :force => true do |t|
    t.integer  "PortalID"
    t.string   "Url",                                         :null => false
    t.string   "UrlType",     :limit => 1,                    :null => false
    t.integer  "Clicks",                                      :null => false
    t.datetime "LastClick"
    t.datetime "CreatedDate",                                 :null => false
    t.boolean  "LogActivity",                                 :null => false
    t.boolean  "TrackClicks",              :default => true,  :null => false
    t.integer  "ModuleId"
    t.boolean  "NewWindow",                :default => false, :null => false
  end

  add_index "UrlTracking", ["PortalID", "Url", "ModuleId"], :name => "IX_UrlTracking", :unique => true

  create_table "Urls", :primary_key => "UrlID", :force => true do |t|
    t.integer "PortalID"
    t.string  "Url",      :null => false
  end

  add_index "Urls", ["Url", "PortalID"], :name => "IX_Urls", :unique => true

  create_table "UserAuthentication", :primary_key => "UserAuthenticationID", :force => true do |t|
    t.integer "UserID",                              :null => false
    t.string  "AuthenticationType",  :limit => 100,  :null => false
    t.string  "AuthenticationToken", :limit => 1000, :null => false
  end

  add_index "UserAuthentication", ["UserID", "AuthenticationType"], :name => "IX_UserAuthentication", :unique => true

  create_table "UserDefinedData", :primary_key => "UserDefinedDataId", :force => true do |t|
    t.integer "UserDefinedFieldId",                 :null => false
    t.integer "UserDefinedRowId",                   :null => false
    t.string  "FieldValue",         :limit => 2000, :null => false
  end

  add_index "UserDefinedData", ["UserDefinedFieldId"], :name => "IX_UserDefinedData"
  add_index "UserDefinedData", ["UserDefinedRowId"], :name => "IX_UserDefinedData_1"

  create_table "UserDefinedFields", :primary_key => "UserDefinedFieldId", :force => true do |t|
    t.integer "ModuleId",                                :null => false
    t.string  "FieldTitle", :limit => 50,                :null => false
    t.boolean "Visible",                                 :null => false
    t.integer "FieldOrder",               :default => 0, :null => false
    t.string  "FieldType",  :limit => 20,                :null => false
  end

  add_index "UserDefinedFields", ["ModuleId"], :name => "IX_UserDefinedFields"

  create_table "UserDefinedRows", :primary_key => "UserDefinedRowId", :force => true do |t|
    t.integer "ModuleId", :null => false
  end

  add_index "UserDefinedRows", ["ModuleId"], :name => "IX_UserDefinedRows"

  create_table "UserPortals", :primary_key => "UserPortalId", :force => true do |t|
    t.integer  "UserId",                        :null => false
    t.integer  "PortalId",                      :null => false
    t.datetime "CreatedDate",                   :null => false
    t.boolean  "Authorised",  :default => true, :null => false
  end

  add_index "UserPortals", ["PortalId"], :name => "IX_UserPortals"
  add_index "UserPortals", ["UserId"], :name => "IX_UserPortals_1"

  create_table "UserProfile", :primary_key => "ProfileID", :force => true do |t|
    t.integer  "UserID",                                              :null => false
    t.integer  "PropertyDefinitionID",                                :null => false
    t.string   "PropertyValue",        :limit => 3750
    t.text     "PropertyText"
    t.integer  "Visibility",                           :default => 0, :null => false
    t.datetime "LastUpdatedDate",                                     :null => false
  end

  add_index "UserProfile", ["UserID"], :name => "IX_UserProfile"

  create_table "UserRoles", :primary_key => "UserRoleID", :force => true do |t|
    t.integer  "UserID",        :null => false
    t.integer  "RoleID",        :null => false
    t.datetime "ExpiryDate"
    t.boolean  "IsTrialUsed"
    t.datetime "EffectiveDate"
  end

  add_index "UserRoles", ["RoleID"], :name => "IX_UserRoles"
  add_index "UserRoles", ["UserID"], :name => "IX_UserRoles_1"

  create_table "Users", :primary_key => "UserID", :force => true do |t|
    t.string  "Username",       :limit => 100,                    :null => false
    t.string  "FirstName",      :limit => 50,                     :null => false
    t.string  "LastName",       :limit => 50,                     :null => false
    t.boolean "IsSuperUser",                   :default => false, :null => false
    t.integer "AffiliateId"
    t.string  "Email",          :limit => 256
    t.string  "DisplayName",    :limit => 128, :default => "",    :null => false
    t.boolean "UpdatePassword",                :default => false, :null => false
  end

  add_index "Users", ["Username"], :name => "IX_Users", :unique => true

  create_table "UsersOnline", :id => false, :force => true do |t|
    t.integer  "UserID",         :null => false
    t.integer  "PortalID",       :null => false
    t.integer  "TabID",          :null => false
    t.datetime "CreationDate",   :null => false
    t.datetime "LastActiveDate", :null => false
  end

  create_table "VendorClassification", :primary_key => "VendorClassificationId", :force => true do |t|
    t.integer "VendorId",         :null => false
    t.integer "ClassificationId", :null => false
  end

  add_index "VendorClassification", ["ClassificationId"], :name => "IX_VendorClassification_1"
  add_index "VendorClassification", ["VendorId", "ClassificationId"], :name => "IX_VendorClassification", :unique => true

  create_table "Vendors", :primary_key => "VendorId", :force => true do |t|
    t.string   "VendorName",    :limit => 50,                    :null => false
    t.string   "Street",        :limit => 50
    t.string   "City",          :limit => 50
    t.string   "Region",        :limit => 50
    t.string   "Country",       :limit => 50
    t.string   "PostalCode",    :limit => 50
    t.string   "Telephone",     :limit => 50
    t.integer  "PortalId"
    t.string   "Fax",           :limit => 50
    t.string   "Email",         :limit => 50
    t.string   "Website",       :limit => 100
    t.integer  "ClickThroughs",                :default => 0,    :null => false
    t.integer  "Views",                        :default => 0,    :null => false
    t.string   "CreatedByUser", :limit => 100
    t.datetime "CreatedDate"
    t.string   "LogoFile",      :limit => 100
    t.text     "KeyWords"
    t.string   "Unit",          :limit => 50
    t.boolean  "Authorized",                   :default => true, :null => false
    t.string   "FirstName",     :limit => 50
    t.string   "LastName",      :limit => 50
    t.string   "Cell",          :limit => 50
  end

  add_index "Vendors", ["PortalId", "VendorName"], :name => "IX_Vendors", :unique => true

  create_table "Version", :primary_key => "VersionId", :force => true do |t|
    t.integer  "Major",                     :null => false
    t.integer  "Minor",                     :null => false
    t.integer  "Build",                     :null => false
    t.datetime "CreatedDate",               :null => false
    t.string   "Name",        :limit => 50
  end

  add_index "Version", ["Major", "Minor", "Build"], :name => "IX_Version", :unique => true

  create_table "aspnet_Applications", :id => false, :force => true do |t|
    t.string "ApplicationName",        :limit => 256,                       :null => false
    t.string "LoweredApplicationName", :limit => 256,                       :null => false
    t.string "ApplicationId",          :limit => nil, :default => "newid(", :null => false
    t.string "Description",            :limit => 256
  end

  add_index "aspnet_Applications", ["ApplicationName"], :name => "UQ__aspnet_Applicati__1C1D2798", :unique => true
  add_index "aspnet_Applications", ["LoweredApplicationName"], :name => "UQ__aspnet_Applicati__1D114BD1", :unique => true
  add_index "aspnet_Applications", ["LoweredApplicationName"], :name => "aspnet_Applications_Index"

  create_table "aspnet_Membership", :id => false, :force => true do |t|
    t.string   "ApplicationId",                          :limit => nil,                :null => false
    t.string   "UserId",                                 :limit => nil,                :null => false
    t.string   "Password",                               :limit => 128,                :null => false
    t.integer  "PasswordFormat",                                        :default => 0, :null => false
    t.string   "PasswordSalt",                           :limit => 128,                :null => false
    t.string   "MobilePIN",                              :limit => 16
    t.string   "Email",                                  :limit => 256
    t.string   "LoweredEmail",                           :limit => 256
    t.string   "PasswordQuestion",                       :limit => 256
    t.string   "PasswordAnswer",                         :limit => 128
    t.boolean  "IsApproved",                                                           :null => false
    t.boolean  "IsLockedOut",                                                          :null => false
    t.datetime "CreateDate",                                                           :null => false
    t.datetime "LastLoginDate",                                                        :null => false
    t.datetime "LastPasswordChangedDate",                                              :null => false
    t.datetime "LastLockoutDate",                                                      :null => false
    t.integer  "FailedPasswordAttemptCount",                                           :null => false
    t.datetime "FailedPasswordAttemptWindowStart",                                     :null => false
    t.integer  "FailedPasswordAnswerAttemptCount",                                     :null => false
    t.datetime "FailedPasswordAnswerAttemptWindowStart",                               :null => false
    t.text     "Comment"
  end

  add_index "aspnet_Membership", ["ApplicationId", "LoweredEmail"], :name => "aspnet_Membership_index"

  create_table "aspnet_Profile", :id => false, :force => true do |t|
    t.string   "UserId",               :limit => nil, :null => false
    t.text     "PropertyNames",                       :null => false
    t.text     "PropertyValuesString",                :null => false
    t.binary   "PropertyValuesBinary",                :null => false
    t.datetime "LastUpdatedDate",                     :null => false
  end

  create_table "aspnet_Roles", :id => false, :force => true do |t|
    t.string "ApplicationId",   :limit => nil,                       :null => false
    t.string "RoleId",          :limit => nil, :default => "newid(", :null => false
    t.string "RoleName",        :limit => 256,                       :null => false
    t.string "LoweredRoleName", :limit => 256,                       :null => false
    t.string "Description",     :limit => 256
  end

  add_index "aspnet_Roles", ["ApplicationId", "LoweredRoleName"], :name => "aspnet_Roles_index1", :unique => true

  create_table "aspnet_SchemaVersions", :id => false, :force => true do |t|
    t.string  "Feature",                 :limit => 128, :null => false
    t.string  "CompatibleSchemaVersion", :limit => 128, :null => false
    t.boolean "IsCurrentVersion",                       :null => false
  end

  create_table "aspnet_Users", :id => false, :force => true do |t|
    t.string   "ApplicationId",    :limit => nil,                       :null => false
    t.string   "UserId",           :limit => nil, :default => "newid(", :null => false
    t.string   "UserName",         :limit => 256,                       :null => false
    t.string   "LoweredUserName",  :limit => 256,                       :null => false
    t.string   "MobileAlias",      :limit => 16
    t.boolean  "IsAnonymous",                     :default => false,    :null => false
    t.datetime "LastActivityDate",                                      :null => false
  end

  add_index "aspnet_Users", ["ApplicationId", "LastActivityDate"], :name => "aspnet_Users_Index2"
  add_index "aspnet_Users", ["ApplicationId", "LoweredUserName"], :name => "aspnet_Users_Index", :unique => true

  create_table "aspnet_UsersInRoles", :id => false, :force => true do |t|
    t.string "UserId", :limit => nil, :null => false
    t.string "RoleId", :limit => nil, :null => false
  end

  add_index "aspnet_UsersInRoles", ["RoleId"], :name => "aspnet_UsersInRoles_index"

  create_table "eeCalendarModules", :id => false, :force => true do |t|
    t.integer "CalendarId", :null => false
    t.integer "ModuleId",   :null => false
  end

  create_table "eeCalendars", :primary_key => "CalendarId", :force => true do |t|
    t.string  "Title",    :limit => 100, :null => false
    t.integer "ParentId"
    t.integer "PortalId"
  end

  create_table "eeEvents", :primary_key => "ItemId", :force => true do |t|
    t.string   "Title",        :limit => 100,  :null => false
    t.string   "Description",  :limit => 3000, :null => false
    t.datetime "StartDate",                    :null => false
    t.datetime "EndDate"
    t.datetime "ExpiryDate"
    t.integer  "CalendarId",                   :null => false
    t.string   "ShowInParent", :limit => 1,    :null => false
  end

  create_table "gammacon_UserDefinedTableData", :primary_key => "UserDefinedTableDataId", :force => true do |t|
    t.integer "UserDefinedTableFieldId",                 :null => false
    t.integer "UserDefinedTableRowId",                   :null => false
    t.string  "FieldValue",              :limit => 2000
  end

  create_table "gammacon_UserDefinedTableFields", :primary_key => "UserDefinedTableFieldId", :force => true do |t|
    t.integer "ModuleId",                                     :null => false
    t.string  "FieldTitle", :limit => 50,                     :null => false
    t.boolean "Required",                                     :null => false
    t.integer "FieldOrder",                 :default => 0,    :null => false
    t.string  "FieldType",  :limit => 20,                     :null => false
    t.string  "Default",    :limit => 2000, :default => "",   :null => false
    t.boolean "Visible",                    :default => true, :null => false
  end

  create_table "gammacon_UserDefinedTableRows", :primary_key => "UserDefinedTableRowId", :force => true do |t|
    t.integer "ModuleId", :null => false
  end

  create_table "thornHillEvents", :force => true do |t|
    t.string  "EventType",    :limit => 50,                  :null => false
    t.string  "Title",        :limit => 50
    t.string  "TimeOfYear",   :limit => 50
    t.string  "TimeEvent",    :limit => 25
    t.string  "LocationEV",   :limit => 50
    t.string  "ContactName",  :limit => 50
    t.string  "ContactPhone", :limit => 15
    t.string  "ContactEmail", :limit => 50
    t.integer "tabOrder",                     :default => 0, :null => false
    t.string  "EventDesc",    :limit => 2000
    t.integer "ImageId",                      :default => 0, :null => false
  end

  create_table "thornHillImage", :force => true do |t|
    t.string "name",  :limit => 50,                           :null => false
    t.string "type",  :limit => 50, :default => "image/jpeg", :null => false
    t.binary "image",                                         :null => false
  end

  create_table "thornHillNewNeighbors", :force => true do |t|
    t.string   "Name",       :limit => 100
    t.string   "Address",    :limit => 100
    t.datetime "PostDate"
    t.datetime "RemoveDate"
  end

  create_table "thornHillOfficers", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.string  "OfficerOrg",   :limit => 5,  :null => false
    t.string  "OfficerName",  :limit => 30
    t.string  "OfficerTitle", :limit => 40
    t.string  "OfficerPhone", :limit => 15
    t.string  "OfficerEmail", :limit => 50
  end

  create_table "thornHillSection", :force => true do |t|
    t.string  "sectionTitle",        :limit => 50
    t.string  "sectionBlurb",        :limit => 8000
    t.string  "sectionDisplayTitle", :limit => 500,                          :null => false
    t.string  "pageType",            :limit => 20,   :default => "Standard", :null => false
    t.string  "pageName",            :limit => 50
    t.string  "primarySection",      :limit => 50
    t.string  "menuTitle",           :limit => 20
    t.integer "menuOrder"
    t.integer "ImageID"
  end

  create_table "thornhillCalendar", :force => true do |t|
    t.datetime "EventDate",                                             :null => false
    t.string   "TimeOfDay",     :limit => 30
    t.string   "Headline",      :limit => 50,                           :null => false
    t.string   "Description",   :limit => 1000
    t.string   "Location",      :limit => 100
    t.string   "POC",           :limit => 50
    t.string   "POC_Phone",     :limit => 15
    t.string   "POC_Email",     :limit => 50
    t.string   "EventType",     :limit => 20,   :default => "STANDARD", :null => false
    t.string   "CanBeUpcoming", :limit => 1,    :default => "Y",        :null => false
  end

  create_table "thornhillConnectionCategory", :id => false, :force => true do |t|
    t.string "CategoryName", :limit => 50, :null => false
  end

  create_table "thornhillConnections", :force => true do |t|
    t.string "Place",    :limit => 50,  :null => false
    t.string "Phone",    :limit => 20
    t.string "Category", :limit => 50
    t.string "Address",  :limit => 200
    t.string "website",  :limit => 100
  end

  create_table "thornhillLinks", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.string  "DisplayText", :limit => 50,  :null => false
    t.string  "NavigateURL", :limit => 100, :null => false
    t.string  "Description"
  end

  create_table "thornhillNews", :force => true do |t|
    t.datetime "ItemDate",                       :null => false
    t.datetime "ItemPostDate"
    t.datetime "ItemRemoveDate"
    t.string   "Headline",       :limit => 50,   :null => false
    t.string   "Item",           :limit => 1000, :null => false
  end

  create_table "thornhillResourcesOLD", :force => true do |t|
    t.string  "CompanyName", :limit => 50
    t.string  "Name",        :limit => 50
    t.string  "Phone",       :limit => 20
    t.string  "Address",     :limit => 100
    t.string  "Email",       :limit => 50
    t.string  "Website",     :limit => 100
    t.string  "Subcategory", :limit => 50
    t.string  "Description", :limit => 500
    t.integer "ImageID"
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

  create_table "thornhillYOTM", :force => true do |t|
    t.string  "Name",      :limit => 50
    t.string  "Address",   :limit => 50
    t.string  "YOTMMonth", :limit => 20
    t.integer "ImageID"
  end

  create_table "thornhillYOTM2003", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.string  "Area",      :limit => 25
    t.string  "Name",      :limit => 50
    t.string  "Address",   :limit => 50
    t.string  "YOTMMonth", :limit => 20
    t.integer "ImageID"
  end

  create_table "thornhillYOTM2004", :force => true do |t|
    t.string  "Area",      :limit => 25
    t.string  "Name",      :limit => 50
    t.string  "Address",   :limit => 50
    t.string  "YOTMMonth", :limit => 20
    t.integer "ImageID"
  end

end
