もし(/^メイン画面にアクセス$/) do
  visit '/'
end

もし(/^"(.*?)"をクリック$/) do |str|
  click_on str
end

ならば(/^問題は"(.*?)" "(.*?)" "(.*?)" "(.*?)"$/) do |first, second, third, fourth|
  # TODO install rspec
  # should have_css('.first', text: first)
end

ならば(/^正解する$/) do
  # TODO install rspec
  # should have_content('正解')
end

ならば(/^メイン画面を表示$/) do
  # TODO install
  # should have_content('スタート')
end