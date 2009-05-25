Given /^言語は"([^\"]*)"$/ do |lang|
  header("ACCEPT_LANGUAGE", lang)
end

When /^"([^\"]*)"としてファイル"([^\"]*)"をContent\-Type"([^\"]*)"として添付する$/ do |field, path, content_type|
  attach_file(field, path, content_type)
end

When /"([^\"]*)"中の"([^\"]*)"リンクをクリックする$/ do |element, label|
  click_link_within(element, label)
end

When /^テーブル"([^\"]*)"の"([^\"]*)"行目の"([^\"]*)"リンクをクリックする$/ do |css, nth, label|
  selector = "table.#{css} tbody tr:nth(#{nth})"
  click_link_within(selector, label)
end

When /^デバッグのため$/ do
  save_and_open_page
end

Then /^テキストフィールドに"([^\"]*)"と表示されていること$/ do |text|
  response.should have_tag("input[type=text][value=#{text}]")
end

