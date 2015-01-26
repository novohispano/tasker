namespace :printer do
  desc "Executes printing command"
  task run: :environment do
    if system("rake test:all") == false
      puts "The tests fail."
    else
      puts "The tests passed."
      puts "Pushing to Github"
      system("git push origin master")
      puts "Done."
    end
  end
end
