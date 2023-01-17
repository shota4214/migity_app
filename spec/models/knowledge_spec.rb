require 'rails_helper'

RSpec.describe Knowledge, type: :model do
  describe 'knowledgeモデルのバリデーションテスト' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:knowledge) { FactoryBot.create(:knowledge, user: user) }
    context 'タイトルが空白だった場合' do
      example 'バリデーションにかかる' do
        knowledge = Knowledge.new(title: "", content: "失敗をテスト", user: user)
        expect(knowledge).not_to be_valid
      end
    end
    context 'タイトルと内容が記載されている場合' do
      example 'バリデーションが通る' do
        knowledge = Knowledge.new(title: "タイトル", content: "成功をテスト", user: user)
        expect(knowledge).to be_valid
      end
    end
  end
  describe 'knowledgeモデルのcreate'
end