require "bridgetown"
require 'time'

Bridgetown.load_tasks

# Run rake without specifying any command to execute a deploy build by default.
task default: :deploy

#
# Standard set of tasks, which you can customize if you wish:
#
desc "Build the Bridgetown site for deployment"
task deploy: [:clean, "frontend:build"] do
  Bridgetown::Commands::Build.start
end

desc "Build the site in a test environment"
task :test do
  ENV["BRIDGETOWN_ENV"] = "test"
  Bridgetown::Commands::Build.start
end

desc "Runs the clean command"
task :clean do
  Bridgetown::Commands::Clean.start
end

namespace :frontend do
  desc "Build the frontend with esbuild for deployment"
  task :build do
    sh "touch frontend/styles/jit-refresh.css"
    sh "yarn run esbuild"
  end

  desc "Watch the frontend with esbuild during development"
  task :dev do
    sh "touch frontend/styles/jit-refresh.css"
    sh "yarn run esbuild-dev"
  rescue Interrupt
  end
end

# A task that scaffolds out the structure for a new writing post.
# It creates a new markdown file in the _writing directory with the format YYYY-MM-DD-title.md and correct frontmatter.
# It also creates a new directory in the assets/images/writing directory with the same name as the post file date.
task :new_post, [:title] do |t, args|
  title = args.title || 'new-post'
  date = Time.now.strftime('%Y-%m-%d')
  filename = "src/_writing/#{date}-#{title}.md"
  image_dir = "src/images/writing/#{date}"

  Dir.mkdir(image_dir) unless Dir.exist?(image_dir)
  File.new("#{image_dir}/.keep", 'w')

  File.open(filename, 'w') do |file|
    file.write("---\n")
    file.write("title: \"#{title}\"\n")
    file.write("description: \"TODO\"\n")
    file.write("tags:\n")
    file.write("\s\s- TODO\n")
    file.write("image: /images/writing/#{date}/index.webp\n")
    file.write("---\n")
  end

  puts "Created new post: #{filename}"
  puts "Created new image directory: #{image_dir}"
end

#
# Add your own Rake tasks here! You can use `environment` as a prerequisite
# in order to write automations or other commands requiring a loaded site.
#
# task :my_task => :environment do
#   puts site.root_dir
#   automation do
#     say_status :rake, "I'm a Rake tast =) #{site.config.url}"
#   end
# end
