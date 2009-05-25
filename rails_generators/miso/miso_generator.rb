
# This generates Japanized useful step definithions for Cucumber with Rails.
class MisoGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'features/step_definitions'
      m.template  'webrat_ja_steps.rb', 'features/step_definitions/webrat_ja_steps.rb'
    end
  end

protected

  def banner
    "Usage: #{$0} miso"
  end

  def add_options!(opt)
    # do nothing at now
  end
end
