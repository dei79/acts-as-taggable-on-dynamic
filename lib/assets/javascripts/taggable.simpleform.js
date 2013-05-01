$(function() {

    function adjustStyleOfTagForm(el, removable) {
        $(el).addClass("input string")
        $(el).find("label").addClass("string control-label")
        $(el).find("input").addClass("string")

        $(el).find("label").each(function(index, model) {
            $(model).text($(model).text().capitalize())
        })

    if (removable) {
        $(el).append('<a href="" class="tag_action icon-remove-sign"></a>')
    }
}

    $("ul#user_tag_context_form li div.field").each(function(index, model) {
        adjustStyleOfTagForm(model, true);
    })

    $("div#act-as-taggable-dynamic-new_context_form").each(function(index, model) {
        adjustStyleOfTagForm(model, false);
    })


    $("div#act-as-taggable-dynamic-new_context_form a").addClass('icon-plus-sign')
    $("div#act-as-taggable-dynamic-new_context_form a").text("")

    $("ul#user_tag_context_form li div.field a.tag_action").live('click', function() {
        $(this).closest('li').addClass("hide")
        $(this).closest('li').find("input").attr("value", "")
        return false;
    })

    var origAppend = $.fn.append;

    $.fn.append = function () {
        var result = origAppend.apply(this, arguments).trigger("append");
        if($(this).parent().attr("id") == "user_tag_context_form" ) {

            // add the element
            $(this).find('.field').each(function(index, obj) {
                adjustStyleOfTagForm(obj, true);
            })

            // empty the form
            $('#act-as-taggable-dynamic-new_context_form input').val("")
        }


        return result;
    };
})
