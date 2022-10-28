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

Question.create!(
  title: "肺がんの薬使用について",
  content: "オプシーボの使用方法について考えました",
  resolved: true,
  draft: false,
  user_id: 5
)
Question.create!(
  title: "胃がんの薬使用について",
  content: "オキサリプラチンの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5
)
Question.create!(
  title: "膵臓がんの薬使用について",
  content: "ギメラシルの使用方法について考えました",
  resolved: false,
  draft: true,
  user_id: 5
)
Question.create!(
  title: "咽頭がんの薬使用について",
  content: "ブリプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 2
)
Question.create!(
  title: "皮膚がんの薬使用について",
  content: "シスプラチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 3
)
Question.create!(
  title: "大腸がんの薬使用について",
  content: "イリノテカンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 4
)
Question.create!(
  title: "白血病の薬使用について",
  content: "ビンクリスチンの使用方法について考えました",
  resolved: false,
  draft: false,
  user_id: 1
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


labels = ["消化器内科", "呼吸器内科", "呼吸器外科", "血液内科", "泌尿器科", "婦人科", "脳神経外科", "耳鼻咽喉科", "歯科口腔外科", "内分泌外科", "皮膚科", "整形外科", "放射線腫瘍科", "麻酔科", "神経精神科", "化学療法・緩和ケア科", "ゲノム診療科",]
labels.each do |label|
  Label.create!(name: label)
end

Label.all.each do |label|
  label.label_details.create!(label_id: label.id, content: "クスリ名#{label.id}" )
  label.label_details.create!(label_id: label.id, content: "クスリ名#{label.id + 1}" )
  label.label_details.create!(label_id: label.id, content: "クスリ名#{label.id + 2}" )
end

Labelling.create!(question_id: 1, label_id: 2)
Labelling.create!(question_id: 2, label_id: 1)
Labelling.create!(question_id: 3, label_id: 10)
Labelling.create!(question_id: 4, label_id: 1)
Labelling.create!(question_id: 5, label_id: 11)
Labelling.create!(question_id: 6, label_id: 1)
Labelling.create!(question_id: 7, label_id: 4)