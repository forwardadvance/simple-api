class ApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :version, :type => :string, :default => "v1"

  def create_api
    @resource_class = resource_class
    @resource_name = resource_name
    @version = version
    template "app/controllers/controller.rb", "app/controllers/api/#{version}/#{file_name.pluralize}_controller.rb"
    template "app/views/index.json.jbuilder", "app/views/api/#{version}/#{folder_name.pluralize}/index.json.jbuilder"
    template "app/views/show.json.jbuilder", "app/views/api/#{version}/#{folder_name.pluralize}/show.json.jbuilder"
  end

  def alert_route
    puts ["Please now create the following route in your config/routes.rb file:",
    "namespace :api, :defaults => {:format => :json} do",
    "  namespace :#{@version} do",
    "    resources :#{@resource_name.pluralize}, except: [:new, :edit]",
    "  end",
    "end"].map{|l| "#{l}\n" }
  end

  private

    def resource_name
      name.underscore
    end
    alias_method :file_name, :resource_name
    alias_method :folder_name, :resource_name

    def resource_class
      name.constantize
    end

end

  # def create_api_folder
  #   create_folder "app/controllers/api", "# Add initialization content here"
  #   create_folder "app/views/api", "# Add initialization content here"
  # end
