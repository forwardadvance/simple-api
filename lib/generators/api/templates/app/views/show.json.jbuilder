json.extract! @<%= @resource_name %>,
  <%= (@resource_class.attribute_names.map{|a|":#{a}"}-[":id", ":created_at", ":updated_at", ":password", ":password_confirmation", ":salt", ":admin", ":is_admin", ":login"]).join(",\n    ") %>
