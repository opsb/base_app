# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def formatted_date_range(from, to)
    formatted_from = from.strftime "#{from.day.ordinalize} %b"
    formatted_to   = to.strftime "#{to.day.ordinalize} %b %Y"
    "#{formatted_from} - #{formatted_to}"
  end
  
end
