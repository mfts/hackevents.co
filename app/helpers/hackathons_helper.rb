module HackathonsHelper
  class FormBuilder 
    def date_select(method, options = {}, html_options = {})
      existing_date = @object.send(method) 
      formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
      @template.content_tag(:div, :class => "input-group") do    
        text_field(method, :value => formatted_date, :class => "form-control datepicker1", :"data-date-format" => "YYYY-MM-DD") +
        @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
      end
    end

    def datetime_select(method, options = {}, html_options = {})
      existing_time = @object.send(method) 
      formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
      @template.content_tag(:div, :class => "input-group") do    
        text_field(method, :value => formatted_time, :class => "form-control datetimepicker1", :"data-date-format" => "YYYY-MM-DD hh:mm A") +
        @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
      end
    end
  end

  def add_child_button(name, association,target)
    content_tag(:span,"<span>#{name}</span>".html_safe,
      :class => "add_child",
      :"data-association" => association,
      :target => target)
  end

  def remove_child_button(name)
    content_tag(:div,"<span>Remove</span>".html_safe,
      :class => "remove_child btn btn-danger")
  end

  def new_fields_template(f,association,options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize+"_fields"
    options[:template] ||= association.to_s+"_fields"
    options[:f] ||= :f

    tmpl = content_tag(:div,:id =>"#{options[:template]}") do
      tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |b|
        render(:partial=>options[:partial],:locals =>{:u => b})
      end
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ''

    template = '<div id="events_fields"><div class="form-group"> <label for="hackathon_events_attributes_new_events_time_start">Time start</label> <input placeholder="10:00 AM" class="form-control" type="text" name="hackathon[events_attributes][new_events][time_start]" id="hackathon_events_attributes_new_events_time_start"/></div><div class="form-group"> <label for="hackathon_events_attributes_new_events_name">Name</label> <input placeholder="Hacking Begins" class="form-control" type="text" name="hackathon[events_attributes][new_events][name]" id="hackathon_events_attributes_new_events_name"/></div><div class="form-group"> <label for="hackathon_events_attributes_new_events_description">Description</label> <textarea class="form-control" name="hackathon[events_attributes][new_events][description]" id="hackathon_events_attributes_new_events_description"></textarea></div><input class="removable" type="hidden" value="false" name="hackathon[events_attributes][new_events][_destroy]" id="hackathon_events_attributes_new_events__destroy"/><div class="remove_child btn btn-danger"><span>Remove</span></div></div>'
    return "<script> var #{options[:template]} = '#{template.to_s}' </script>".html_safe
  end
end