class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def main; end

  def set_variables variables
    variables.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def layout_by_resource
    if devise_controller?
      if resource_name == :admin
        "admin"
      else
        "etc"
      end
    else
      "application"
    end
  end

end
