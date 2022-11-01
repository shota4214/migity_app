User.create!(name: "みぎたか", pharmacy: "migity", email: "migitaka@test.com", password: "123456", position: "社長", pharmacist: true, admin: true, image: File.open('./app/assets/images/bear.png'))
[
  ["すずき", "migity薬局", "suzuki@test.com", "123456", "エンジニア", image: File.open('./app/assets/images/dog.png')],
  ["くりた", "ミギティー薬局", "kurita@test.com", "123456", "エンジニア", image: File.open('./app/assets/images/cat.png')],
  ["やのう", "ミギー薬局", "yanou@test.com", "123456", "デザイナー", image: File.open('./app/assets/images/rabbit.png')],
  ["はぎわら", "migi薬局", "hagiwara@test.com", "123456", "薬剤師", image: File.open('./app/assets/images/elephant.png')]
].each do |name, pharmacy, email, password, position, image|
  User.create!(
    { name: name, pharmacy: pharmacy, email: email, password: password, position: position, image: image})
end

diseases = ["脳腫瘍", "頭頸部癌", "唾液線がん", "甲状腺がん", "肺がん", "乳がん", "小細胞肺がん", "中皮腫", "膵臓がん", "胃がん", "GIST", "小腸がん", "大腸がん", "食道がん", "腎臓がん", "腎盂・尿管がん", "膀胱がん", "前立腺がん", "子宮頸がん", "卵巣がん", "子宮肉腫", "悪性リンパ腫", "白血病", "慢性リンパ性白血病", "多発性骨髄腫", "皮膚がん", "メラノーマ", "肉腫", "原発不明がん"]
diseases.each do |disease|
  Disease.create!(name: disease)
end

Disease.all.each do |disease|
  disease.disease_details.create!(content: "ステージ0" )
  disease.disease_details.create!(content: "ステージⅠ" )
  disease.disease_details.create!(content: "ステージⅡ" )
  disease.disease_details.create!(content: "ステージⅢ" )
  disease.disease_details.create!(content: "ステージⅣ" )
end

Question.create!(
  title: "肺がんの薬使用について",
  content: "オプシーボの使用方法について考えました",
  resolved: true,
  draft: false,
  user_id: 5,
  disease_id: 5,
  disease_detail_id: 1
)
Question.create!(
  title: "胃がんの薬使用について",
  content: "オキサリプラチンの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
  disease_id: 10,
  disease_detail_id: 2
)
Question.create!(
  title: "膵臓がんの薬使用について",
  content: "ギメラシルの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5,
  disease_id: 9,
  disease_detail_id: 3
)
Question.create!(
  title: "食道がんの薬使用について",
  content: "ブリプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 2,
  disease_id: 14,
  disease_detail_id: 1
)
Question.create!(
  title: "皮膚がんの薬使用について",
  content: "シスプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 3,
  disease_id: 25,
  disease_detail_id: 1
)
Question.create!(
  title: "大腸がんの薬使用について",
  content: "イリノテカンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 4,
  disease_id: 13,
  disease_detail_id: 1
)
Question.create!(
  title: "白血病の薬使用について",
  content: "ビンクリスチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 1,
  disease_id: 23,
  disease_detail_id: 1
)

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
