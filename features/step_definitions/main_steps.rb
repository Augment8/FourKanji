def put_current_path
  puts('current_path: ' + page.current_path)
end

もし(/^メイン画面にアクセス$/) do
  visit '/'
  put_current_path
end

もし(/^四字熟語登録画面にアクセス$/) do
  visit '/idioms/new'
  put_current_path
end

もし(/^"(.*?)"をクリック$/) do |str|
  click_on str
  put_current_path
end

もし(/^"(.*?)"に"(.*?)"を入力$/) do |key, value|
  fill_in key, with: value
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
  should have_css('.alert')
end

ならば(/^メイン画面を表示$/) do
  should have_content('スタート')
end

ならば(/^正解数は (\d+)$/) do |n|
  should have_css('.point', text: n)
end

ならば(/^"(.*?)"と通知$/) do |message|
  should have_css('.notification', message)
end
