class AngularGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_api
    @resource_class = resource_class
    @resource_name = resource_name
    template 'app/controllers//controller.rb', "app/controllers/#{file_name.pluralize}_controller.rb"
    template 'app/views/index.html.haml', "app/views/#{folder_name.pluralize}/index.html.haml"
    template 'app/views/show.html.haml', "app/views/#{folder_name.pluralize}/show.html.haml"
    template 'app/views/edit.html.haml', "app/views/#{folder_name.pluralize}/edit.html.haml"
    template 'app/views/new.html.haml', "app/views/#{folder_name.pluralize}/new.html.haml"
    template 'app/views/form.html.haml', "app/views/#{folder_name.pluralize}/form.html.haml"
    template 'app/views/list.html.haml', "app/views/#{folder_name.pluralize}/list.html.haml"
    template "app/assets/javascripts/angular.js", "app/assets/javascripts/#{file_name.pluralize}.js"
  end

  def alert_route
    puts [
      "Please now create the following route in your config/routes.rb file:",
      "resources :#{@resource_name.pluralize} do",
      '  collection do',
      '    get :list',
      '    get :form',
      '  end',
      'end'
    ].map { |l| "#{l}\n" }
  end

  def alert_angular
    puts [
      'Please now ad the following to assets/javascripts/admin.js file:',
      "//= require #{@resource_name.pluralize}",
    ].map { |l| "#{l}\n" }
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
