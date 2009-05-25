require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'fileutils'
require 'spec/rake/spectask'
require 'lib/miso'
include FileUtils

use_rubyforge = false
NAME              = "miso"
AUTHOR            = "MOROHASHI Kyosuke"
EMAIL             = "moronatural@gmail.com"
DESCRIPTION       = "dip cukes into me."

if use_rubyforge
  require 'rake/contrib/rubyforgepublisher'
  require 'rake/contrib/sshpublisher'
  RUBYFORGE_PROJECT = "miso"
  HOMEPAGE          = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"
else
  HOMEPAGE          = "http://github.com/moro/#{NAME}/"
end
BIN_FILES         = %w(  )

VERS              = Miso::Version
REV = File.read(".svn/entries")[/committed-rev="(d+)"/, 1] rescue nil
CLEAN.include ['**/.*.sw?', '*.gem', '.config']
RDOC_OPTS = [
	'--title', "#{NAME} documentation",
	"--charset", "utf-8",
	"--opname", "index.html",
	"--line-numbers",
	"--main", "README.rdoc",
	"--inline-source",
]

task :default => [:spec]
task :package => [:clean]

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = %w[--colour --format progress --loadby --reverse]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

spec = Gem::Specification.new do |s|
	s.name              = NAME
	s.version           = VERS
	s.platform          = Gem::Platform::RUBY
	s.has_rdoc          = true
	s.extra_rdoc_files  = ["README.rdoc", "ChangeLog"]
	s.rdoc_options     += RDOC_OPTS + ['--exclude', '^(examples|extras)/']
	s.summary           = DESCRIPTION
	s.description       = DESCRIPTION
	s.author            = AUTHOR
	s.email             = EMAIL
	s.homepage          = HOMEPAGE
	s.executables       = BIN_FILES
	s.rubyforge_project = RUBYFORGE_PROJECT if use_rubyforge
	s.bindir            = "bin"
	s.require_path      = "lib"
	s.test_files        = Dir["test/*_test.rb"]

	#s.add_dependency('activesupport', '>=1.3.1')
	#s.required_ruby_version = '>= 1.8.2'

	s.files = %w(README.rdoc ChangeLog Rakefile) +
		Dir.glob("{bin,doc,test,lib,templates,generator,extras,website,script,rails_generators}/**/*") + 
		Dir.glob("ext/**/*.{h,c,rb}") +
		Dir.glob("examples/**/*.rb") +
		Dir.glob("tools/*.rb") +
		Dir.glob("rails/*.rb")

	s.extensions = FileList["ext/**/extconf.rb"].to_a
end

Rake::GemPackageTask.new(spec) do |p|
	p.need_tar = true
	p.gem_spec = spec
end

task :install do
	name = "#{NAME}-#{VERS}.gem"
	sh %{rake package}
	sh %{gem install pkg/#{name}}
end

task :uninstall => [:clean] do
	sh %{gem uninstall #{NAME}}
end

desc 'Show information about the gem.'
task :debug_gem do
	puts spec.to_ruby
end

desc 'Update gem spec'
task :gemspec do
  open("#{NAME}.gemspec", 'w').write spec.to_ruby
end


Rake::RDocTask.new do |rdoc|
	rdoc.rdoc_dir = 'html'
	rdoc.options += RDOC_OPTS
	rdoc.template = "resh"
	#rdoc.template = "#{ENV['template']}.rb" if ENV['template']
	if ENV['DOC_FILES']
		rdoc.rdoc_files.include(ENV['DOC_FILES'].split(/,\s*/))
	else
		rdoc.rdoc_files.include('README', 'ChangeLog')
		rdoc.rdoc_files.include('lib/**/*.rb')
		rdoc.rdoc_files.include('ext/**/*.c')
	end
end

if use_rubyforge
  desc "Publish to RubyForge"
  task :rubyforge => [:rdoc, :package] do
    require 'rubyforge'
    Rake::RubyForgePublisher.new(RUBYFORGE_PROJECT, 'moro').upload
  end

  desc 'Package and upload the release to rubyforge.'
  task :release => [:clean, :package] do |t|
    v = ENV["VERSION"] or abort "Must supply VERSION=x.y.z"
    abort "Versions don't match #{v} vs #{VERS}" unless v == VERS
    pkg = "pkg/#{NAME}-#{VERS}"

    require 'rubyforge'
    rf = RubyForge.new.configure
    puts "Logging in"
    rf.login

    c = rf.userconfig
  #	c["release_notes"] = description if description
  #	c["release_changes"] = changes if changes
    c["preformatted"] = true

    files = [
      "#{pkg}.tgz",
      "#{pkg}.gem"
    ].compact

    puts "Releasing #{NAME} v. #{VERS}"
    rf.add_release RUBYFORGE_PROJECT, NAME, VERS, *files
  end
end

