User.create!(name: "みぎたか", pharmacy: "migity", email: "migitaka@test.com", password: "123456", position: "社長", pharmacist: true, admin: true, prefectures: 22, image: File.open('./app/assets/images/bear.png'))
[
  ["すずき", "migity薬局", "suzuki@test.com", "123456", "エンジニア", 22, false, File.open('./app/assets/images/dog.png')],
  ["くりた", "ミギティー薬局", "kurita@test.com", "123456", "エンジニア", 11, false, File.open('./app/assets/images/cat.png')],
  ["やのう", "ミギー薬局", "yanou@test.com", "123456", "デザイナー", 14, false, File.open('./app/assets/images/rabbit.png')],
  ["はぎはら", "migi薬局", "hagihara@test.com", "123456", "薬剤師", 27, false, File.open('./app/assets/images/elephant.png')],
  ["佐々木三郎", "佐々木病院", "sasaki@test.com", "123456", "がん薬物療法認定薬剤師", 13, true, File.open('./app/assets/images/sasaki.png')],
  ["岡田浩司", "東北医科薬科大学病院", "okada@test.com", "123456", "がん薬物療法認定薬剤師", 13, true, File.open('./app/assets/images/mituo.png')],
  ["山本", "山本病院", "yamamoto@test.com", "123456", "がん薬物療法認定薬剤師", 13, true, File.open('./app/assets/images/yamamoto.png')]
].each do |name, pharmacy, email, password, position, prefectures, pharmacist, image|
  User.create!(
    { name: name, pharmacy: pharmacy, email: email, password: password, position: position, prefectures: prefectures, pharmacist: pharmacist, image: image})
end

diseases = [
  "大腸癌", "肺がん", "肺癌", "乳癌"
]
diseases.each do |disease|
  Disease.create!(name: disease)
end

Knowledge.create!(
  title: "肺がんの薬使用について",
  content: "オプシーボの使用方法について考えました",
  resolved: true,
  draft: false,
  user_id: 5,
)
Knowledge.create!(
  title: "胃がんの薬使用について",
  content: "オキサリプラチンの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
)
Knowledge.create!(
  title: "膵臓がんの薬使用について",
  content: "ギメラシルの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
)
Knowledge.create!(
  title: "食道がんの薬使用について",
  content: "ブリプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 2,
)
Knowledge.create!(
  title: "皮膚がんの薬使用について",
  content: "シスプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 3,
)
Knowledge.create!(
  title: "大腸がんの薬使用について",
  content: "イリノテカンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 4,
)
Knowledge.create!(
  title: "白血病の薬使用について",
  content: "ビンクリスチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 1,
)

DiseaseLabelling.create!(knowledge_id: 1, disease_id: 1)
DiseaseLabelling.create!(knowledge_id: 1, disease_id: 2)
DiseaseLabelling.create!(knowledge_id: 2, disease_id: 3)
DiseaseLabelling.create!(knowledge_id: 3, disease_id: 4)
DiseaseLabelling.create!(knowledge_id: 3, disease_id: 1)
DiseaseLabelling.create!(knowledge_id: 4, disease_id: 1)
DiseaseLabelling.create!(knowledge_id: 4, disease_id: 4)
DiseaseLabelling.create!(knowledge_id: 4, disease_id: 3)
DiseaseLabelling.create!(knowledge_id: 5, disease_id: 2)
DiseaseLabelling.create!(knowledge_id: 6, disease_id: 3)
DiseaseLabelling.create!(knowledge_id: 6, disease_id: 4)
DiseaseLabelling.create!(knowledge_id: 6, disease_id: 1)
DiseaseLabelling.create!(knowledge_id: 7, disease_id: 2)

Favorite.create!(user_id: 2, knowledge_id: 1)
Favorite.create!(user_id: 3, knowledge_id: 1)
Favorite.create!(user_id: 4, knowledge_id: 1)
Favorite.create!(user_id: 2, knowledge_id: 3)
Favorite.create!(user_id: 5, knowledge_id: 4)
Favorite.create!(user_id: 1, knowledge_id: 5)
Favorite.create!(user_id: 2, knowledge_id: 5)

Comment.create!(user_id: 2, knowledge_id: 5, content: "コメントさせていただきます")
Comment.create!(user_id: 1, knowledge_id: 5, content: "私もコメントさせていただきます")
Comment.create!(user_id: 3, knowledge_id: 5, content: "コメントありがとうございます")
Comment.create!(user_id: 2, knowledge_id: 1, content: "コメントさせていただきます")
Comment.create!(user_id: 3, knowledge_id: 1, content: "私もコメントさせていただきます")
Comment.create!(user_id: 1, knowledge_id: 1, content: "コメントありがとうございます")
Comment.create!(user_id: 2, knowledge_id: 2, content: "コメントさせていただきます")
Comment.create!(user_id: 3, knowledge_id: 2, content: "私もコメントさせていただきます")
Comment.create!(user_id: 5, knowledge_id: 2, content: "コメントありがとうございます")
Comment.create!(user_id: 6, knowledge_id: 1, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 6, knowledge_id: 2, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 6, knowledge_id: 3, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 1, knowledge_id: 4, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 7, knowledge_id: 5, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 7, knowledge_id: 6, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 8, knowledge_id: 7, content: "そのがんについては…", best_answer: true)

licenses = [
  "医療薬学専門薬剤師", "がん専門薬剤師", "がん指導薬剤師", "外来がん治療専門薬剤師", "外来がん認定薬剤師"
]
licenses.each do |license|
  License.create!(name: license)
end

PharmacistDetail.create!(office_name: "株式会社migity", user_id: 1, )
PharmacistDetail.create!(office_name: "佐々木病院", user_id: 6, )
PharmacistDetail.create!(office_name: "岡田総合病院", user_id: 7, )
PharmacistDetail.create!(office_name: "山本病院", user_id: 8, )

drugs = [
  "ベバシズマブ", "ラムシルマブ", "アフリベルセプト", "ネシツムマブ",
  "セツキシマブ", "パニツムマブ",
  "レゴラフェニブ",
  "ゲフィチニブ", "エルロチニブ", "アファチニブ", "オシメルチニブ", "ダコミチニブ",
  "クリゾチニブ", "アレクチニブ", "セリチニブ", "ロルラチニブ", "ブリグチニブ",
  "ダブラフィニブ", "トラメチニブ",
  "エヌトレクチニブ", "ラロトレクチニブ",
  "セルペルカニチブ",
  "ソトラシブ",
  "デノスマブ",
  "トラスツズマブ", "ペルツズマブ", "トラスツズマブ", "エムタンシン", "ラパチニブ",
  "オラパリブ",
  "アベマシクリブ", "パルボシクリブ",
  "ニボルマブ", "ペムブロリズマブ", "アテゾリズマブ", "デュルバルマブ", "イピリムマブ"
]
drugs.each do |drug|
  Drug.create!(name: drug)
end

DrugLabelling.create!(knowledge_id: 1, drug_id: 1)
DrugLabelling.create!(knowledge_id: 1, drug_id: 2)
DrugLabelling.create!(knowledge_id: 1, drug_id: 3)
DrugLabelling.create!(knowledge_id: 2, drug_id: 5)
DrugLabelling.create!(knowledge_id: 3, drug_id: 5)
DrugLabelling.create!(knowledge_id: 4, drug_id: 5)
DrugLabelling.create!(knowledge_id: 5, drug_id: 7)
DrugLabelling.create!(knowledge_id: 5, drug_id: 9)
DrugLabelling.create!(knowledge_id: 6, drug_id: 13)
DrugLabelling.create!(knowledge_id: 7, drug_id: 18)

side_effects = [
  "血管外漏出", "血管障害",
  "過敏症", "アナフィラキシー", "インフュージョンリアクション",
  "骨髄抑制", "感染", "FNなど",
  "悪心嘔吐", "食欲不振",
  "口内炎",
  "下痢", "便秘",
  "腎障害", "膀胱障害", "蛋白尿", "腫瘍崩壊症候群",
  "肝障害",
  "心毒性",
  "血圧上昇", "血栓症",
  "末梢神経障害",
  "中枢神経障害", "聴覚障害", "白質脳症", "肝性脳症", "せん妄", "うつ",
  "倦怠感", "筋肉痛", "関節痛",
  "間質性肺炎",
  "皮膚障害", "手足症候群",
  "脱毛",
  "浮腫"
]
side_effects.each do |side_effect|
  SideEffect.create!(name: side_effect)
end

SideEffectLabelling.create!(knowledge_id: 1, side_effect_id: 3)
SideEffectLabelling.create!(knowledge_id: 1, side_effect_id: 4)
SideEffectLabelling.create!(knowledge_id: 1, side_effect_id: 5)
SideEffectLabelling.create!(knowledge_id: 2, side_effect_id: 14)
SideEffectLabelling.create!(knowledge_id: 3, side_effect_id: 12)
SideEffectLabelling.create!(knowledge_id: 4, side_effect_id: 7)
SideEffectLabelling.create!(knowledge_id: 5, side_effect_id: 9)
SideEffectLabelling.create!(knowledge_id: 6, side_effect_id: 11)
SideEffectLabelling.create!(knowledge_id: 6, side_effect_id: 13)
SideEffectLabelling.create!(knowledge_id: 7, side_effect_id: 16)