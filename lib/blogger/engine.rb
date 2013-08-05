module Blogger
  class Engine < ::Rails::Engine
    isolate_namespace Blogger

    #initializer "blogger.assets.precompile" do |app|
    #  app.config.assets.precompile += %w(wysihtml5-0.4.0pre.min.js wysihtml5-advanced.js)
    #end

  end
end
