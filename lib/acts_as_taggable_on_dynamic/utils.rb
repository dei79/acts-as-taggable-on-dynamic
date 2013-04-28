module ActsAsTaggableOnDynamic
  module Utils

    def self.included(base)
      base.send :include, ActsAsTaggableOnDynamic::Utils::InstanceMethods
    end

    module InstanceMethods

      ##
      # Return an array of context names which are valid for the given model type
      #
      # Example:
      #   self.tag_context_list => ['tags']
      #
      def tag_context_list
        ActsAsTaggableOn::Tagging.where("taggable_type = '#{self.class.name}'").select(:context).uniq.map(&:context)
      end
    end
  end
end