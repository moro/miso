# encoding: utf-8

require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^"([^\"]*)"ページを表示している$/ do |page_name|
  Given %{I am on #{page_name}}
end

When /^"([^\"]*)"ページを表示する$/ do |page_name|
  Given %{I go to #{page_name}}
end

When /^"([^\"]*)"ボタンをクリックする$/ do |button|
  When %{I press "#{button}"}
end

When /^"([^\"]*)"リンクをクリックする$/ do |link|
  When %{I follow "#{link}"}
end

When /^"([^\"]*)"の"([^\"]*)"リンクをクリックする$/ do |parent, link|
  When %{I follow "#{link}" within "#{parent}"}
end

When /^"([^\"]*)"に"([^\"]*)"と入力する$/ do |field, value|
  When %{I fill in "#{field}" with "#{value}"}
end

When /^以下の項目を入力する:$/ do |fields|
  When %{I fill in the following:}, fields
end

When /^"([^\"]*)"から"([^\"]*)"を選択する$/ do |field, value|
  When %{I select "#{value}" from "#{field}"}
end

When /^日時として"([^\"]*)"を選択する$/ do |time|
  When %{I select "#{time}" as the date and time}
end

When /^"([^\"]*)"の日時として"([^\"]*)"を選択する$/ do |datetime_label, datetime|
  When %{I select "#{datetime}" as the "#{datetime_label}" date and time}
end

When /^時間として"([^\"]*)"を選択する$/ do |time|
  When %{I select "#{time}" as the time}
end

When /^"([^\"]*)"の時間として"([^\"]*)"を選択する$/ do |time_label, time|
  When %{I select "#{time}" as the "#{time_label}" time}
end

When /^日付として"([^\"]*)"を選択する$/ do |date|
  When %{I select "#{date}" as the date}
end

When /^"([^\"]*)"の日付として"([^\"]*)"を選択する$/ do |date_label, date|
  When %{I select "#{date}" as the "#{date_label}" date}
end

When /^"([^\"]*)"をチェックする$/ do |field|
  When %{I check "#{field}"}
end

When /^"([^\"]*)"のチェックを外す$/ do |field|
  When %{I uncheck "#{field}"}
end

When /^"([^\"]*)"を選択する$/ do |field|
  When %{I choose "#{field}"}
end

When /^"([^\"]*)"としてファイル"([^\"]*)"を選択する$/ do |field, path|
  When %{I attach the file at "#{path}" to "#{field}"}
end

Then /^"([^\"]*)"と表示されていること$/ do |text|
  Then %{I should see "#{text}"}
end

Then /^"([^\"]*)"に"([^\"]*)"と表示されていること$/ do |selector, text|
  Then %{I should see "#{text}" within "#{selector}"}
end

Then /^\/([^\/]*)\/と表示されていること$/ do |regexp|
  Then %{I should see /#{regexp}/}
end

Then /^"([^\"]*)"に\/([^\/]*)\/と表示されていること$/ do |selector, regexp|
  Then %{I should see \/#{regexp}\/ within "#{selector}"}
end

Then /^"([^\"]*)"と表示されていないこと$/ do |text|
  Then %{I should not see "#{text}"}
end

Then /^"([^\"]*)"に"([^\"]*)"と表示されていないこと$/ do |selector, text|
  Then %{I should not see "#{text}" within "#{selector}"}
end

Then /^\/([^\/]*)\/と表示されていないこと$/ do |regexp|
  Then %{I should not see /#{regexp}/}
end

Then /^"([^\"]*)"に\/([^\/]*)\/と表示されていないこと$/ do |selector, regexp|
  Then %{I should not see \/#{regexp}\/ within "#{selector}"}
end

Then /^入力項目"([^\"]*)"に"([^\"]*)"と表示されていること$/ do |field, value|
  Then %{the "#{field}" field should contain "#{value}"}
end

Then /^入力項目"([^\"]*)"に"([^\"]*)"と表示されていないこと$/ do |field, value|
  Then %{the "#{field}" field should not contain "#{value}"}
end

Then /^"([^\"]*)"がチェックされていること$/ do |label|
  Then %{the "#{label}" checkbox should be checked}
end

Then /^"([^\"]*)"がチェックされていないこと$/ do |label|
  Then %{the "#{label}" checkbox should not be checked}
end

Then /^"([^\"]*)"ページを表示していること$/ do |page_name|
  Then %{I should be on #{page_name}}
end

show_me_the_page = lambda { Then %{show me the page} }
Then /^ページを表示する$/, &show_me_the_page
Then /^画面を目視$/, &show_me_the_page

# backword-compat for old japanese translation.
Then /^デバッグ(?:のため)?$/, &show_me_the_page

