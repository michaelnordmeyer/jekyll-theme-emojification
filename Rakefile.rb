# frozen_string_literal: true

## Deployment settings
gemspec = File.absolute_path(File.basename(File.dirname(__FILE__)) + ".gemspec")
artefact = Gem::Specification::load(gemspec).name
version = Gem::Specification::load(gemspec).version

task :default => ["gembuild"]

desc 'Builds the icons'
task :icons do
  puts "==> Building #{artefact} icons..."
  sh '_tools/generate-icons.sh assets/css . webp'
  sh '_tools/generate-icons.sh assets/css . svg'
end

desc 'Builds the site for deployment'
task :build do
  Rake::Task[:icons].invoke
  puts "==> Building #{artefact}..."
  sh 'JEKYLL_ENV="production" bundle exec jekyll build'
end

desc 'Builds the demo site for deployment'
task :demobuild do
  Rake::Task[:gembuild].invoke
  Rake::Task[:geminstall].invoke
  puts "==> Building #{artefact} demo..."
  sh 'cd _demo && rake build'
end

desc 'Serves the site locally'
task :serve do
  Rake::Task[:icons].invoke
  puts "==> Building and serving #{artefact} locally..."
  sh 'bundle exec jekyll serve'
end

desc 'Serves the demo site locally'
task :demoserve do
  Rake::Task[:gembuild].invoke
  Rake::Task[:geminstall].invoke
  puts "==> Building and serving #{artefact} demo locally..."
  sh 'cd _demo && rake serve'
end

desc 'Builds and deploys the demo site'
task :demodeploy do
  Rake::Task[:gembuild].invoke
  Rake::Task[:geminstall].invoke
  puts "==> Building and deploying #{artefact} demo..."
  sh 'cd _demo && rake deploy'
end

desc 'Builds and deploys the demo robots.txt'
task :demodeployrobots do
  puts "==> Building and deploying #{artefact} demo robots.txt..."
  sh 'cd _demo && rake deployrobots'
end

desc 'Cleans the source dir'
task :clean do
  puts "==> Cleaning #{artefact}..."
  sh 'bundle exec jekyll clean'
end

desc 'Cleans the demo source dir'
task :democlean do
  puts "==> Cleaning #{artefact} demo..."
  sh 'cd _demo && bundle exec jekyll clean'
end

desc 'Builds the gem'
task :gembuild do
  puts "==> Building #{artefact} gem..."
  sh "gem build #{artefact}.gemspec"
end

desc 'Installs the gem locally according to the gemspec\'s version'
task :geminstall do
  puts "==> Installing #{artefact} gem locally..."
  sh "gem install --local #{artefact}-#{version}.gem"
end

desc 'Uninstalls the gem according to the gemspec\'s version'
task :gemuninstall do
  puts "==> Uninstalling #{artefact} gem..."
  sh "gem uninstall #{artefact} --version #{version}"
end

desc 'Pushes the gem to rubygems.org according to the gemspec\'s version'
task :gempush do
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{version}.gem"
end

desc 'Pushes the gem to rubygems.org, needs version number like `rake gempush\[1.0.0\]`'
task :gempushversioned, [:version] do |task, args|
  puts "==> Pushing #{artefact} to rubygems.org..."
  sh "gem push #{artefact}-#{args[:version]}.gem"
end
