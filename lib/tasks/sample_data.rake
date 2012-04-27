namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    admin = User.create!(:name => "Taylor Eichhorst",
                 :email => "taylor.eichhorst@gmail.com",
                 :password => "toolworks",
                 :password_confirmation => "toolworks")
                 admin.toggle!(:admin)
    50.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    users = User.all(:limit => 6)
    15.times do
      story_title = Faker::Lorem.sentence(5)
      users.each { |user| user.stories.create!(:story_title => story_title) }
    end
    
    stories = Story.all(:limit => 4)
    10.times do
      pagecontent = Faker::Lorem.sentences(10)
      stories.each { |story| story.pages.create!(:pagecontent => pagecontent, :user_id => story.user_id)}
    end
  end
           
 end

