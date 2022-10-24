module QuestionsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_questions_path
    elsif action_name == 'edit'
      question_path
    end
  end

  def resolved_text(question)
    if question.resolved
      "解決済み"
    else
      "回答受付中"
    end
  end

  def comment_count(question)
    all_comment = question.comments.count.to_i
    my_comment = question.comments.where(user_id: question.user.id).count.to_i
    all_comment - my_comment
  end
end
