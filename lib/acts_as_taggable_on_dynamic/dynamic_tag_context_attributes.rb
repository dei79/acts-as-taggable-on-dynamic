module ActsAsTaggableOnDynamic
  module DynamicTagContextAttributes

    def self.included(base)
      base.send :include, ActsAsTaggableOnDynamic::DynamicTagContextAttributes::InstanceMethods
    end

    module InstanceMethods
      ##
      # Returns a text string which returns generates the list attribute given by the context name for taggings
      #
      # Example:
      #   self.dynamic_tag_context_attribute("skills") => "dynamic_tag_context_skill_list"
      #
      def dynamic_tag_context_attribute(context)
        "dynamic_tag_context_#{context.singularize}_list"
      end

      def dynamic_tag_context_attribute_template()
        "dynamic_tag_context_{{context}}_list"
      end

      def dynamic_tag_context_label_template()
        "{{context}}"
      end

      ##
      # Validates if the given attribute is a dynamic context tag
      #
      def dynamic_tag_context_attribute?(attribute)
        (attribute.to_s.start_with?('dynamic_tag_context_') && attribute.to_s.ends_with?('_list'))
      end

      ##
      # Returns the context of a give attributes name
      #
      def dynamic_tag_context_from_attribute(attribute)
        attribute.to_s.sub('dynamic_tag_context_', '').chomp('_list').pluralize
      end

      ##
      # Validates if the given attribute is a tag list attribute
      def tag_list_attribute?(attribute)
        attribute.to_s.ends_with?('_list')
      end

      ##
      # Returns the contetn of a give tag list
      #
      def tag_list_content_on(context)
       self.tags_on(context).map(&:to_s).join(',').chomp(',')
      end

      ##
      # Handles all read and write operations to a dynamic tag context
      #
      def method_missing(method_name, *args, &block)

        attribute = method_name.to_s.chomp('=')

        if ( dynamic_tag_context_attribute?(attribute) || tag_list_attribute?(attribute))

          context = dynamic_tag_context_from_attribute(attribute).to_sym

          if (method_name.to_s.ends_with?("="))
            self.set_tag_list_on(context, args.join(',').chomp(','))
          else
            return tag_list_content_on(context)
          end
        else
          super
        end
      end

      ##
      # Validates if the requested method a supported method
      #
      def respond_to?(method_name, include_private = false)
        dynamic_tag_context_attribute?(method_name.to_s.chomp("=")) || tag_list_attribute?(method_name.to_s.chomp("=")) || super
      end


      def mass_assignment_authorizer(role)
        ActsAsTaggableOnDynamic::DynamicMassAssignmentAuthorizer.new(self, super(role))
      end
    end
  end
end