FactoryBot.define do
  factory :question do
    title { 'question_title' }
    content { 'question_content' }
    association :user
  end
  factory :draft_question, class: Question do
    title { 'draft_question_title' }
    content { 'draft_question_content' }
    draft { 'true' }
    association :user
  end
  factory :resolved_question, class: Question do
    title { 'resolved_question_title' }
    content { 'resolved_question_content' }
    resolved { 'true' }
    association :user
  end
end