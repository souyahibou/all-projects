module GooglePage2
  class Engine < ::Rails::Engine
    isolate_namespace GooglePage2

    initializer "google_page2.assets.precompile" do |app|
      # app.config.assets.paths << GooglePage2::Engine.root.join("app", "assets", "Projet_Google_2") #useless at final already does by defaut
      app.config.assets.precompile += [ Proc.new { |filename, path| path =~ /#{GooglePage2::Engine.root}\/app\/assets/ && %w(.js .css).include?(File.extname(filename)) }, /application.(css|js)$/ ]   #add also further all file_path inner assets with(&&) .js and .css extension: because these files was excluded by default
      # app.config.assets.precompile += ['*.js', '*.css', '**/*.js', '**/*.css', '*.jpg', '*.png', '*.ico', '*.gif', '*.woff2', '*.eot', '*.woff', '*.ttf', '*.svg']  #too custom
    end
  end
end
