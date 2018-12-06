module Usine
  class Engine < ::Rails::Engine
    isolate_namespace Usine

    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s)
        config.paths["db/migrate"].expanded.each do |p|
          app.config.paths["db/migrate"] << p
        end
      end
    end    #avoid to run railties:install:migrations from console
  end
end
