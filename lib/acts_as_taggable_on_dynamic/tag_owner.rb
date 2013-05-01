module ActsAsTaggableOnDynamic
  module TagOwner
    def self.included(base)
      base.send :include, ActsAsTaggableOnDynamic::TagOwner::InstanceMethods
    end

    module InstanceMethods

      ###
      # This method allows to set the owner of the tags which will be set
      # during the next operations
      #
      def tag_owner=(owner)
        @tag_owner = owner
      end

      ###
      # Returns the tag owner which was set
      #
      def tag_owner
        @tag_owner || nil
      end

      ###
      # Validates if the auto tag ownership enabled
      #
      def is_auto_tag_ownership_enabled?
        (self.tag_owner != nil)
      end
    end
  end
end
