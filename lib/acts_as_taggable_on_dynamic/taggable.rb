module ActsAsTaggableOnDynamic
   module Taggable

     def acts_as_taggable_dynamic
       # make the model taggable from the original gem
       acts_as_taggable

       # add the specific model methods we need
       class_eval do
         include ActsAsTaggableOnDynamic::Utils
         include ActsAsTaggableOnDynamic::DynamicTagContextAttributes
       end
     end
   end
end