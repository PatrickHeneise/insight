# Based on http://www.railsforum.com/viewtopic.php?id=28447&p=1
module Admin::LecturesHelper
	def add_link(form_builder, method)
    link_to_function 'Add' do |page|
			obj = form_builder.object.class.reflect_on_association(method).klass.new
      form_builder.fields_for method, obj, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => method.to_s.singularize, :locals => { :form => f, :fid => 'NEW_RECORD' })
				page << "var new_id = new Date().getTime(); $(\"#{escape_javascript(html)}\").appendTo(\"div##{method.to_s}\"); $(\"div#events\").html($(\"div#events\").html().replace(/NEW_RECORD/g, new_id));"
				page << "$(\".tabs\").tabs(); $(\".tabs\").each(function() { if($(this).parents(\".event\").find(\".blocked\").val() == \"true\") $(this).tabs(\"select\", 1); });"
				page << "$(\"a.tabbing\").click(function () {	var $tabs = $(this).parents(\"div.tabs\").tabs();	var selected = $tabs.tabs(\"option\", \"selected\"); $(this).parents(\"div.event\").find(\".blocked\").val(new Boolean(selected)); });"
				page << "$(\".date-picker\").datepicker({ showOn: \"button\", buttonImageOnly: true, dateFormat: \"dd.mm.yy\", minDate: new Date(), buttonImage: \"/images/icon_cal.png\" });"

			end
		end
	end
	
	# Display the remove link for a child form
  def remove_link(form_builder, method)
    if form_builder.object.new_record?
      # If the task is a new record, we can just remove the div from the dom
      link_to_function 'remove' do |page|
				page << "$(this).parents('.#{method.to_s.singularize}').remove()"
			end
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
      link_to_function('remove', "$(this).parent('.#{method.to_s.singularize}').hide(); $(this).previous().value = '1'")
    end
  end 
end
