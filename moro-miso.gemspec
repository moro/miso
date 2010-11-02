# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{moro-miso}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MOROHASHI Kyosuke"]
  s.date = %q{2010-02-03}
  s.default_executable = %q{miso-cheat}
  s.description = %q{dip cukes into me.}
  s.email = %q{moronatural@gmail.com}
  s.executables = ["miso-cheat"]
  s.extra_rdoc_files = ["README.rdoc", "ChangeLog"]
  s.files = ["README.rdoc", "ChangeLog", "Rakefile", "lib/miso.rb", "generators/miso/miso_generator.rb", "generators/miso/templates/web_extra_ja_steps.rb", "generators/miso/templates/web_steps_ja.rb", "bin/miso-cheat"]
  s.homepage = %q{http://github.com/moro/miso/}
  s.rdoc_options = ["--title", "moro-miso documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README.rdoc", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{dip cukes into me.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber-rails>, [">= 0.2.4"])
    else
      s.add_dependency(%q<cucumber-rails>, [">= 0.2.4"])
    end
  else
    s.add_dependency(%q<cucumber-rails>, [">= 0.2.4"])
  end
end
