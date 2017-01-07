module ApplicationHelper
  def uncapitalize(text)
    text[0, 1].downcase + text[1..-1]
  end
end
