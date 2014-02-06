class Forms::Builder < ActionView::Helpers::FormBuilder
  def to_partial_path
    "form"
  end

  def date_and_time_field(name)
    @template.render "forms/fields/date_and_time_field", form: self, name: name
  end
end
