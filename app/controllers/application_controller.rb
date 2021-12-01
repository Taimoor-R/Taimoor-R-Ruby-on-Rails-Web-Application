class ApplicationController < ActionController::Base
  include CurrentCart # includes current cart method in application controller everytime appication page is reneded or restart it cals on this.
end
