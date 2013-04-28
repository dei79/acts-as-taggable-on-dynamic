module ActsAsTaggableOnDynamic

end

# load the dependencies
require('acts-as-taggable-on')

# load our code
require('acts_as_taggable_on_dynamic/dynamic_mass_assignment_authorizer')
require('acts_as_taggable_on_dynamic/dynamic_tag_context_attributes')
require('acts_as_taggable_on_dynamic/dynamic_tag_helpers')
require('acts_as_taggable_on_dynamic/taggable')
require('acts_as_taggable_on_dynamic/utils')

# handle ActiveRecord stuff
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsTaggableOnDynamic::Taggable
end

if defined?(ActionView::Base)
  ActionView::Base.send :include, ActsAsTaggableOnDynamic::DynamicTagHelpers
end
