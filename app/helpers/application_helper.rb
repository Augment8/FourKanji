module ApplicationHelper
  def question_box(str)
    return '□' if str.nil?

    str
  end

  def answer_form(str)
    ret = form_tag "/game", method: :put do
      [
        hidden_field_tag(:answer, str),
        submit_tag(str),
      ].join.html_safe
    end
  end
end
