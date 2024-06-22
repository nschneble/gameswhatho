namespace :db do
  desc "Reset the database, then run all migrations and seeds"
  task new_game: :environment do
    puts "Resetting the database..."
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke

    puts "Running migrations..."
    Rake::Task["db:migrate"].invoke

    puts "Running seeds..."
    Rake::Task["db:seed"].invoke

    puts "Database reset, migrations run, seeds loaded."
  end
end
