$(function() {

    function getTemplateIdFromModelType(modeltype) {
        return "#" + modeltype + "_new_context_form_template"
    }

    function applyContextTemplate(el) {
        // build the template id
        var templateId = getTemplateIdFromModelType($(el).attr("data-model-type"))

        // get the context from the element
        var context = $(el).attr("data-context")

        // get the current value from the element
        var values = $(el).attr("data-value")

        // do it
        createNewContextFormInListItem(el, templateId, context, values)
    }

    function createNewContextFormInListItem(el, fromTemplate, forContext, withValues) {
        // load the template of the element
        var source   = $(fromTemplate).html();

        // compile the template via handlebars
        var template = Handlebars.compile(source);

        // generate the data field
        var data = { context: forContext, context_attribute: forContext.singularize(), values: withValues};

        // attach the formular to the element
        $(el).append(template(data))
    }


    $('li[data-context]').each(function(index, value) {
        applyContextTemplate(value)
    })

    $('div#act-as-taggable-dynamic-new_context_form a').click(function() {
        // get the value
        var value = $('div#act-as-taggable-dynamic-new_context_form a').parent().find('input').val()

        // get the model type
        var modeltype = $('div#act-as-taggable-dynamic-new_context_form a').parent().find('input').attr('data-model-type')

        // read out the model type
        var templateId = getTemplateIdFromModelType(modeltype)

        // find the list for this model type
        var list = $("ul#" + modeltype + "_tag_context_form")

        // create the list item we need
        var listItem = $('<li></li>').appendTo(list)

        // generate a new context
        createNewContextFormInListItem(listItem , templateId, value, "")
    })
})