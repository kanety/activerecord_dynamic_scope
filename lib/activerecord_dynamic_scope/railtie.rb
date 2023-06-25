module ActiveRecordDynamicScope
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.include ActiveRecordDynamicScope::Extension
    end
  end
end
