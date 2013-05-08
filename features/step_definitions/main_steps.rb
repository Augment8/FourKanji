もし(/^メイン画面にアクセス$/) do
  visit '/'
end

もし(/^"(.*?)"をクリック$/) do |str|
  click_on str
end

ならば(/^問題は"(.*?)" "(.*?)" "(.*?)" "(.*?)"$/) do |first, second, third, fourth|
  should have_css('.first', text: first)
  should have_css('.second', text: second)
  should have_css('.third', text: third)
  should have_css('.fourth', text: fourth)
end

ならば(/^正解する$/) do
  should have_css('.success')
end

ならば(/^不正解する$/) do
  should have_css('.failure')
end

ならば(/^メイン画面を表示$/) do
  should have_content('スタート')
end

ならば(/^正解数は (\d+)$/) do |n|
  should have_css('.point', text: n)
end
