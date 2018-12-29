module CvWebpage
  class Engine < ::Rails::Engine
    isolate_namespace CvWebpage

    initializer "cv_webpage.assets.precompile" do |app|
            app.config.assets.precompile += [ Proc.new { |filename, path| path =~ /#{CvWebpage::Engine.root}\/app\/assets/ && %w(.js .css).include?(File.extname(filename)) }, /application.(css|js)$/ ]   #add also further all file_path inner assets with(&&) .js and .css extension: because these files was excluded by default
    end
  end
end
