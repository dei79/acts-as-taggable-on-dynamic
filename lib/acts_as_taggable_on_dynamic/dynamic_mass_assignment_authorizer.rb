class ActsAsTaggableOnDynamic::DynamicMassAssignmentAuthorizer

  def initialize(model, orgAuthorizer)
    @model = model
    @orgAuthorizer = orgAuthorizer
  end

  def deny?(key)
    if (@model.dynamic_tag_context_attribute?(key) || @model.tag_list_attribute?(key))
      false
    else
      @orgAuthorizer.deny?(key)
    end
  end

end