# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

FourKanji::Application.load_tasks

desc 'deploy'
task :deploy do
  sh 'git branch -f deploying'
  sh 'git checkout deploying'
  sh 'RAILS_ENV=production bundle exec rake assets:clobber'
  sh 'RAILS_ENV=production bundle exec rake assets:precompile'
  sh 'git add public/assets'
  sh 'git commit -m "add assets"'
  sh 'git push heroku deploying:master -f'
  ### sh 'heroku run rake db:migrate'
  sh 'git cho master'
end
