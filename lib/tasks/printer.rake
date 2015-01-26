namespace :printer do
  desc "Executes printing command"
  task run: :environment do
    if system("rake test:all") == false
      puts "The tests fail."
    else
      puts "The tests passed."
    end
  end
end
