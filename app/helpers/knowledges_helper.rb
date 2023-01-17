module KnowledgesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_knowledges_path
    elsif action_name == 'edit'
      knowledge_path
    end
  end

  def resolved_text(knowledge)
    if knowledge.resolved
      "解決済み"
    else
      "回答受付中"
    end
  end

  def draft_text(knowledge)
    if knowledge.draft
      "下書き保存中"
    else
      "投稿済み"
    end
  end

  def comment_count(knowledge)
    all_comment = knowledge.comments.count.to_i
    my_comment = knowledge.comments.where(user_id: knowledge.user.id).count.to_i
    all_comment - my_comment
  end

  # def disease_detail_text(knowledge)
  #   disease_detail= DiseaseDetail.find(knowledge.disease_detail_id)
  #   disease_detail.content
  # end
end
