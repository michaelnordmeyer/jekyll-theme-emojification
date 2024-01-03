# frozen_string_literal: true

artefact = `basename ${PWD}`

task :default => ["build"]

desc "Builds the site for deployment"
task :build do
  puts "==> Building #{artefact}..."
  system "bundle exec jekyll build"
end

desc "Serves the site locally"
task :serve do
  puts "==> Building and serving #{artefact} locally..."
  system "bundle exec jekyll serve"
end

desc "Builds the demo site for deployment"
task :demobuild do
  puts "==> Building #{artefact}-demo..."
  system "cd demo && bundle exec jekyll build && cd .."
end

desc "Serves the demo site locally"
task :demoserve do
  puts "==> Building and serving #{artefact} -demo locally..."
  system "cd demo && bundle exec jekyll serve && cd .."
end

desc "Builds the gem"
task :gembuild do
  puts "==> Building gem #{artefact}..."
  system "gem build #{artefact}.gemspec"
end

desc "Installs the local gem, needs version number like `rake geminstall\[1.0.0\]`"
task :geminstall, [:version] do |task, args|
  puts "==> Installing local gem #{artefact}-#{args[:version]}.gem..."
  system "gem install --local #{artefact}-#{args[:version]}.gem"
end

desc "Uninstalls the local gem"
task :gemuninstall do
  puts "==> Uninstalling local gem #{artefact}..."
  system "gem uninstall #{artefact}"
end

desc "Pushes the gem to rubygems.org, needs version number like `rake gempush\[1.0.0\]`"
task :gempush, [:version] do |task, args|
  puts "==> Pushing gem #{artefact}-#{args[:version]}.gem to rubygems.org..."
  system "gem push #{artefact}-#{args[:version]}.gem"
end
