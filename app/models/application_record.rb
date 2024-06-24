# Base class for data models
class ApplicationRecord < ActiveRecord::Base
  include Countable
  include Findable

  primary_abstract_class
end
