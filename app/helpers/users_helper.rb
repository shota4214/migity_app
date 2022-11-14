module UsersHelper

  def number_of_best_answer(user)
    Comment.where(user_id: user.id, best_answer: true).count
  end
end
