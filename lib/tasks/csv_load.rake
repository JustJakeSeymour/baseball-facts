require 'csv'

namespace :csv_load do
  desc 'loads the team csv file into db'
  task teams: :environment do
    csv = File.read('./db/data/teams.csv')
    CSV.parse(csv, headers: true).each do |row|
      Team.create!(row.to_h)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('teams')
  end
end
