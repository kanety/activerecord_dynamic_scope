module ActiveRecordDynamicScope
  module Extension
    extend ActiveSupport::Concern

    class_methods do
      def dynamic_scope(name, as: nil)
        default_scope -> {
          current_scope = ActiveRecordDynamicScope.current(name)
          if current_scope
            where((as || name) => current_scope)
          else
            all
          end
        }
      end
    end
  end
end
