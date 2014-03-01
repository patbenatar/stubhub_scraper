class EventReportForm
  include ActiveAttr::Model

  attribute :sections
  attribute :quantity, type: Integer

  def cleansed_attributes
    {
      quantity: quantity,
      sections: cleansed_sections,
    }
  end

  def cleansed_sections
    return [] unless sections
    sections.split(",").each(&:strip!).map { |s| s.present? ? s : nil }.compact
  end
end
