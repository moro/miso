require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# Commonly used webrat steps
# http://github.com/brynary/webrat

visit = lambda{|page_name| Given "I am on #{page_name}" }

Given(/^"([^\"]*)"ページを表示している$/, &visit)
When(/^"([^\"]*)"ページを表示する$/, &visit)

When /^"([^\"]*)"ボタンをクリックする$/ do |button|
  When %Q(I press "#{button}")
end

When /^"([^\"]*)"リンクをクリックする$/ do |link|
  When %Q(I follow "#{link}")
end

# Order is opposite from original (English) version
When /^"([^\"]*)"の"([^\"]*)"リンクをクリックする$/ do |parent, link|
  When %Q(I follow "#{link}" within "#{parent}")
end

When /^"([^\"]*)"に"([^\"]*)"と入力する$/ do |field, value|
  When %Q(I fill in "#{field}" with "#{value}")
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^以下の項目を入力する:$/ do |fields|
  When %Q(I fill in the following:), fields
end

# opposite order from Engilsh one(original)
When /^"([^\"]*)"から"([^\"]*)"を選択する$/ do |field, value|
  When %Q(I select "#{value}" from "#{field}")
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time
# TODO 日本語が変だ
When /^日時として"([^\"]*)"を選択する$/ do |time|
  When %Q(I select "#{time}" as the date and time)
end

# Use this step when using multiple datetime_select helpers on a page or
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
When /^"([^\"]*)"の日時として"([^\"]*)"を選択する$/ do |datetime_label, datetime|
  When %Q(I select "#{datetime_label}" as the "#{datetime}" date and time)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it.
When /^時間として"([^\"]*)"を選択する$/ do |time|
  When %Q(I select "#{time}" as the time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^"([^\"]*)"の時間として"([^\"]*)"を選択する$/ do |time_label, time|
  When %Q(I select "#{time_label}" as the "#{time}" time)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^日付として"([^\"]*)"を選択する$/ do |date|
  When %Q(I select "#{date}" as the date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^"([^\"]*)"の日付として"([^\"]*)"を選択する$/ do |date_label, date|
  When %Q(I select "#{datetime_label}" as the "#{date}" date)
end

When /^"([^\"]*)"をチェックする$/ do |field|
  When %Q(I check "#{field}")
end

When /^"([^\"]*)"のチェックを外す$/ do |field|
  When %Q(I uncheck "#{field}")
end

When /^"([^\"]*)"を選択する$/ do |field|
  When %Q(I choose "#{field}")
end

# opposite order from Engilsh one(original)
When /^"([^\"]*)"としてファイル"([^\"]*)"を選択する$/ do |field, path|
  When %Q(I attach the file at "#{path}" to "#{field}")
end

Then /^"([^\"]*)"と表示されていること$/ do |text|
  Then %Q(I should see "#{text}")
end

# opposite order from English definition
Then /^"([^\"]*)"に"([^\"]*)"と表示されていること$/ do |selector, text|
  Then %Q(I should see "#{text}" within "#{selector}")
end

Then /^\/([^\/]*)\/と表示されていること$/ do |regexp|
  Then %Q(I should see /#{regexp}/)
end

# opposite order from English definition
Then /^"([^\"]*)"に\/([^\/]*)\/と表示されていること$/ do |selector, regexp|
  Then %Q(I should see \/#{regexp}\/ within "#{selector}")
end

Then /^"([^\"]*)"と表示されていないこと$/ do |text|
  Then %Q(I should not see "#{text}")
end

# opposite order from English definition
Then /^"([^\"]*)"に"([^\"]*)"と表示されていないこと$/ do |selector, text|
  Then %Q(I should not see "#{text}" within "#{selector}")
end

Then /^\/([^\/]*)\/と表示されていないこと$/ do |regexp|
  Then %Q(I should not see /#{regexp}/)
end

# opposite order from English definition
Then /^"([^\"]*)"に\/([^\/]*)\/と表示されていないこと$/ do |selector, regexp|
  Then %Q(I should not see \/#{regexp}\/ within "#{selector}")
end

Then /^入力項目"([^\"]*)"に"([^\"]*)"と表示されていること$/ do |field, value|
  Then %Q(the "#{field}" field should contain "#{value}")
end

Then /^入力項目"([^\"]*)"に"([^\"]*)"と表示されていないこと$/ do |field, value|
  Then %Q(the "#{field}" field should not contain "#{value}")
end

Then /^"([^\"]*)"がチェックされていること$/ do |label|
  Then %Q(the "#{label}" checkbox should be checked)
end

Then /^"([^\"]*)"がチェックされていないこと$/ do |label|
  Then %Q(the "#{label}" checkbox should not be checked)
end

Then /^"([^\"]*)"ページを表示していること$/ do |page_name|
  Then %Q(I should be on #{page_name})
end

show_me_the_page = lambda { Then %Q(show me the page) }
Then(/^ページを表示する$/, &show_me_the_page)
Then(/^デバッグ(?:のため)?$/, &show_me_the_page)
Then(/^画面を目視$/, &show_me_the_page)
