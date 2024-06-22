# Base class for data models
class ApplicationRecord < ActiveRecord::Base
  include Findable

  primary_abstract_class
end
