class Item < ActiveRecord::Base
  dynamic_scope :partition1
  dynamic_scope :partition2
  dynamic_scope :aliased_partition, as: :partition1
end
