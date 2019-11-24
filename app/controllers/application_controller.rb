class ApplicationController < ActionController::Base
  def main; end

  def set_variables variables
    variables.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
