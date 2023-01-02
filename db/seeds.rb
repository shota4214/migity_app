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
  "脳腫瘍", "頭頸部癌", "唾液線がん", "甲状腺がん", "肺がん",
  "乳がん", "小細胞肺がん", "中皮腫", "膵臓がん", "胃がん",
  "GIST", "小腸がん", "大腸がん", "食道がん", "腎臓がん",
  "腎盂・尿管がん", "膀胱がん", "前立腺がん", "子宮頸がん",
  "卵巣がん", "子宮肉腫", "悪性リンパ腫", "白血病", "慢性リンパ性白血病",
  "多発性骨髄腫", "皮膚がん", "メラノーマ", "肉腫", "原発不明がん"
]
diseases.each do |disease|
  Disease.create!(name: disease)
end

Question.create!(
  title: "肺がんの薬使用について",
  content: "オプシーボの使用方法について考えました",
  resolved: true,
  draft: false,
  user_id: 5,
)
Question.create!(
  title: "胃がんの薬使用について",
  content: "オキサリプラチンの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
)
Question.create!(
  title: "膵臓がんの薬使用について",
  content: "ギメラシルの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
)
Question.create!(
  title: "食道がんの薬使用について",
  content: "ブリプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 2,
)
Question.create!(
  title: "皮膚がんの薬使用について",
  content: "シスプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 3,
)
Question.create!(
  title: "大腸がんの薬使用について",
  content: "イリノテカンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 4,
)
Question.create!(
  title: "白血病の薬使用について",
  content: "ビンクリスチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 1,
)

DiseaseLabelling.create!(question_id: 1, disease_id: 5)
DiseaseLabelling.create!(question_id: 1, disease_id: 10)
DiseaseLabelling.create!(question_id: 2, disease_id: 10)
DiseaseLabelling.create!(question_id: 3, disease_id: 9)
DiseaseLabelling.create!(question_id: 3, disease_id: 11)
DiseaseLabelling.create!(question_id: 4, disease_id: 14)
DiseaseLabelling.create!(question_id: 4, disease_id: 15)
DiseaseLabelling.create!(question_id: 4, disease_id: 16)
DiseaseLabelling.create!(question_id: 5, disease_id: 27)
DiseaseLabelling.create!(question_id: 6, disease_id: 13)
DiseaseLabelling.create!(question_id: 6, disease_id: 14)
DiseaseLabelling.create!(question_id: 6, disease_id: 15)
DiseaseLabelling.create!(question_id: 7, disease_id: 24)

Favorite.create!(user_id: 2, question_id: 1)
Favorite.create!(user_id: 3, question_id: 1)
Favorite.create!(user_id: 4, question_id: 1)
Favorite.create!(user_id: 2, question_id: 3)
Favorite.create!(user_id: 5, question_id: 4)
Favorite.create!(user_id: 1, question_id: 5)
Favorite.create!(user_id: 2, question_id: 5)

Comment.create!(user_id: 2, question_id: 5, content: "コメントさせていただきます")
Comment.create!(user_id: 1, question_id: 5, content: "私もコメントさせていただきます")
Comment.create!(user_id: 3, question_id: 5, content: "コメントありがとうございます")
Comment.create!(user_id: 2, question_id: 1, content: "コメントさせていただきます")
Comment.create!(user_id: 3, question_id: 1, content: "私もコメントさせていただきます")
Comment.create!(user_id: 1, question_id: 1, content: "コメントありがとうございます")
Comment.create!(user_id: 2, question_id: 2, content: "コメントさせていただきます")
Comment.create!(user_id: 3, question_id: 2, content: "私もコメントさせていただきます")
Comment.create!(user_id: 5, question_id: 2, content: "コメントありがとうございます")
Comment.create!(user_id: 6, question_id: 1, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 6, question_id: 2, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 6, question_id: 3, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 1, question_id: 4, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 7, question_id: 5, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 7, question_id: 6, content: "そのがんについては…", best_answer: true)
Comment.create!(user_id: 8, question_id: 7, content: "そのがんについては…", best_answer: true)

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
