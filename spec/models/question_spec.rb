require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'questionモデルのバリデーションテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:question) { FactoryBot.create(:question, user: user) }
    context 'タイトルが空白だった場合' do
      example 'バリデーションにかかる' do
        question = Question.new(title: "", content: "失敗をテスト", user: user)
        expect(question).not_to be_valid
      end
    end
    context 'タイトルと内容が記載されている場合' do
      example 'バリデーションが通る' do
        question = Question.new(title: "タイトル", content: "成功をテスト", user: user)
        expect(question).to be_valid
      end
    end
  end
  describe 'questionモデルのcreate'
end