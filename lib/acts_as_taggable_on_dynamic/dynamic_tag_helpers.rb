module ActsAsTaggableOnDynamic
  module DynamicTagHelpers
    def tag_context_form(model)
      content_tag(:ul, :id => "#{model.class.name.downcase}_tag_context_form") do
        model.tag_context_list.collect { |context| concat(content_tag(:li, "", { "data-model-type" => model.class.name.downcase, "data-context" => context, "data-value" => model.tag_list_content_on(context)})) }
      end
    end

    def tag_context_form_template(model)
      content_tag(:script, :id => "#{model.class.name.downcase}_new_context_form_template", :type => "text/x-handlebars-template") do
        content_tag(:div, :class => :field) do
          content_tag(:label, model.dynamic_tag_context_label_template, :for => "#{model.class.name.downcase}_#{model.dynamic_tag_context_attribute_template}") +
          content_tag(:input, "",
                      :id => "#{model.class.name.downcase}_#{model.dynamic_tag_context_attribute_template}",
                      :name => "#{model.class.name.downcase}[#{model.dynamic_tag_context_attribute_template}]",
                      :value => "{{values}}",
                      :size => 30, :type => :text)
        end
      end
    end

    def tag_context_add(model, options = {})
      content_tag(:div, :id => "act-as-taggable-dynamic-new_context_form") do
        content_tag(:label, options[:label] ? options[:label] : "Contextname", :for => "act-as-taggable-dynamic-new_context_form-input") +
        content_tag(:input, "", :name => "act-as-taggable-dynamic-new_context_form-input", :type => :text, "data-model-type" => model.class.name.downcase) +
        content_tag(:a, "add", :href => "#")
      end
    end
  end
end
