namespace :db do
  desc "Reset the database, run all migrations and seeds, and reindex all models"
  task new_game: :environment do
    puts "Resetting the database..."
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke

    puts "Running migrations..."
    Rake::Task["db:migrate"].invoke

    puts "Running seeds..."
    Rake::Task["db:seed"].invoke

    puts "Reindexing models..."
    Rake::Task["searchkick:reindex:all"].invoke

    puts "Database reset, migrations run, seeds loaded, models reindexed"
  end
end
