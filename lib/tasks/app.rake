namespace :app do
  desc "Start the app in development"
  task start: :environment do
    sh "rails s -b 0.0.0.0 -p 4000"
  end
end
