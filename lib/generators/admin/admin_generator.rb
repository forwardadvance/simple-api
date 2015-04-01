# Generates an Angular style API admin system
class AdminGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_admin
    @resource_class = resource_class
    @resource_name = resource_name
    template 'app/controllers/admin/controller.rb', "app/controllers/admin/#{file_name.pluralize}_controller.rb"
    template 'app/views/admin/index.html.haml', "app/views/admin/#{folder_name.pluralize}/index.html.haml"
    template 'app/views/admin/show.html.haml', "app/views/admin/#{folder_name.pluralize}/show.html.haml"
    template 'app/views/admin/edit.html.haml', "app/views/admin/#{folder_name.pluralize}/edit.html.haml"
    template 'app/views/admin/new.html.haml', "app/views/admin/#{folder_name.pluralize}/new.html.haml"
    template 'app/views/admin/_form.html.haml', "app/views/admin/#{folder_name.pluralize}/_form.html.haml"
    template 'app/assets/javascripts/admin/controller.js', "app/assets/javascripts/admin/#{file_name.pluralize}.js"
  end

  def alert_route
    puts [
      "Please now create the following route in your config/routes.rb file:",
      'namespace :admin',
      "  resources :#{@resource_name.pluralize}",
      'end'
    ].map { |l| "#{l}\n" }
  end

  def alert_angular
    puts [
      'Please now ad the following to assets/javascripts/admin.js file:',
      "//= require admin/#{@resource_name.pluralize}",
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
