# frozen_string_literal: true

artefact = "jekyll-theme-emojification"

task :default => ["gembuild"]

desc "Builds the site"
task :build do
  puts "==> Building #{artefact}..."
  system "bundle exec jekyll build"
end

desc "Builds the site for production"
task :build_prod do
  puts "==> Building #{artefact} for production..."
  system "JEKYLL_ENV=\"production\" bundle exec jekyll build"
end

desc "Serves the site locally"
task :serve do
  puts "==> Building and serving #{artefact} locally..."
  system "bundle exec jekyll serve"
end

desc "Builds the demo site"
task :demobuild do
  puts "==> Building #{artefact}-demo..."
  system "cd _demo && rake build"
end

desc "Builds the demo site for production"
task :demobuild do
  puts "==> Building #{artefact}-demo for production..."
  system "cd _demo && rake build_prod"
end

desc "Serves the demo site locally"
task :demoserve do
  puts "==> Building and serving #{artefact} -demo locally..."
  system "cd _demo && rake serve"
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
