module CV
  class Engine < ::Rails::Engine
    isolate_namespace CV

    initializer "c_v.assets.precompile" do |app|
            app.config.assets.precompile += [ Proc.new { |filename, path| path =~ /#{CV::Engine.root}\/app\/assets/ && %w(.js .css).include?(File.extname(filename)) }, /application.(css|js)$/ ]   #add also further all file_path inner assets with(&&) .js and .css extension: because these files was excluded by default
    end
  end
end
