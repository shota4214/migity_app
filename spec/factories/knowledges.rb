FactoryBot.define do
  factory :knowledge do
    title { 'knowledge_title' }
    content { 'knowledge_content' }
    association :user
  end
  factory :draft_knowledge, class: Knowledge do
    title { 'draft_knowledge_title' }
    content { 'draft_knowledge_content' }
    draft { 'true' }
    association :user
  end
  factory :resolved_knowledge, class: Knowledge do
    title { 'resolved_knowledge_title' }
    content { 'resolved_knowledge_content' }
    resolved { 'true' }
    association :user
  end
end