require 'yaml'

$data_folder = "#{File.absolute_path(File.dirname(__FILE__))}/data"

namespace :data do

  desc 'Clear database for local environment'
  task clean: :environment do
    Mongoid::Sessions.default.collections.select { |c| c.name !~ /system/ }.each { |c| c.find.remove_all }
    puts 'all documents and index in database has cleared'
  end

  desc 'import users, groups and courses'
  task import: [:import_users, :import_courses, :import_groups] do
  end

  task import_users: :environment do
    import_model(User)
  end
  task import_courses: :environment do
    import_model(Course)
  end
  task import_groups: :environment do
    import_model(Group)
  end


end

def import_model(clazz)
  File.open("#{Rails.root}/lib/tasks/data/#{clazz.to_s.downcase}.json", "r") do |file|
    while line = file.gets
      JSON.parse(line).each { |model| clazz.new(JSON.parse(model)).save!(validate: false)}
    end
  end
end