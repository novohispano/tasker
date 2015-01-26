namespace :deploy do
  desc "Deploys app to Github & production."
  task all: :environment do
    if system("rake test:all") == false
      puts "The tests fail."
      break
    end

    puts "The tests passed."

    puts "Pushing to Github"
    if system("git push origin master") == false
      puts "Couldn't push to Github"
      break
    end
    puts "Done."

    puts "Pushing to Heroku"
    if system("git push heroku master") == false
      puts "Couldn't push to Heroku"
      break
    end
    puts "Done."

    puts "Running migrations"
    if "GEM_HOME='' BUNDLE_GEMFILE='' GEM_PATH='' RUBYOPT='' /usr/local/heroku/bin/heroku run rake db:migrate" == false
      puts "Could't run migrations"
      break
    end
    puts "Done."
  end
end
