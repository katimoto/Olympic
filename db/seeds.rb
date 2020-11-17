User.create(
    [
        {name: '鈴木太郎', email: 'sitsumon1@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 3},
        {name: '佐々木太郎', email: 'sitsumon2@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 7},
        {name: '田中太郎', email: 'sitsumon3@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 9},
        {name: '高橋花子', email: 'kaitou1@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 11},
        {name: '斎藤花子', email: 'kaitou2@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 14},
        {name: '宮本太郎', email: 'sitsumon4@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 16},
        {name: '宇多川太郎', email: 'sitsumon5@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 19},
        {name: '新橋太郎', email: 'sitsumon6@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 3},
        {name: '坂本花子', email: 'kaitou4@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 3},
        {name: '斎藤今日子', email: 'kaitou5@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 14},
        {name: 'ゲストユーザー', email: 'guest@gmail.com', password: 'guest123', password_confirmation: 'guest123', category_id: 12},
        {name: '池田リナ', email: 'kaitou6@gmail.com', password: 'aa11aa11', password_confirmation: 'aa11aa11', category_id: 5}])
 
Question.create(
    [
        {title: '東京のお土産で喜ばれるもの', text: '今週末東京に行きますが、東京土産で喜ばれるものありますか？', category_id: 2, user_id: 1},
        {title: '好きな動物', text: '一番好きな動物は何ですか？', category_id: 3, user_id: 1},
        {title: '美味しいご飯や', text: '名古屋周辺の美味しいご飯屋さん教えてください', category_id: 4, user_id: 2},
        {title: '明日の天気', text: '明日の天気は？', category_id: 5, user_id: 4},
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', category_id: 6, user_id: 3},
        {title: '東京のお土産で喜ばれるもの', text: '今週末東京に行きますが、東京土産で喜ばれるものありますか？', category_id: 6, user_id: 1},
        {title: '好きな動物', text: '一番好きな動物は何ですか？', category_id: 2, user_id: 5},
        {title: '美味しいご飯や', text: '名古屋周辺の美味しいご飯屋さん教えてください', category_id: 2, user_id: 2},
        {title: '明日の天気', text: '明日の天気は？', category_id: 3, user_id: 5},
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', category_id: 4, user_id: 8},
        {title: '東京のお土産で喜ばれるもの', text: '今週末東京に行きますが、東京土産で喜ばれるものありますか？', category_id: 8, user_id: 1},
        {title: '好きな動物', text: '一番好きな動物は何ですか？', category_id: 9, user_id: 9},
        {title: '美味しいご飯や', text: '名古屋周辺の美味しいご飯屋さん教えてください', category_id: 11, user_id: 10},
        {title: '明日の天気', text: '明日の天気は？', category_id: 14, user_id: 2},
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', category_id: 15, user_id: 3},                
        {title: '英語の勉強法', text: '英語はどうやって勉強したらいいですか？', category_id: 16, user_id: 3}])
 
Answer.create(
    [
        {text: '東京ばな奈じゃないですか？', question_id: 1, user_id: 4},
        {text: 'ラスクみたいなやつ', question_id: 1, user_id: 5},
        {text: '中華まん', question_id: 1, user_id: 6},
        {text: '猫', question_id: 2, user_id: 4},
        {text: '犬', question_id: 2, user_id: 5},
        {text: 'とり', question_id: 2, user_id: 6},
        {text: '矢場とん', question_id: 3, user_id: 4},
        {text: '山ちゃん', question_id: 3, user_id: 5},
        {text: 'みせん', question_id: 3, user_id: 6},
        {text: '晴れ', question_id: 4, user_id: 4},
        {text: '曇り', question_id: 4, user_id: 5},
        {text: '雨', question_id: 4, user_id: 6},
        {text: '1時間', question_id: 5, user_id: 4},
        {text: '2時間', question_id: 5, user_id: 5},
        {text: '3時間', question_id: 5, user_id: 6},
        {text: '特かく話す', question_id: 6, user_id: 4},
        {text: '単語の勉強', question_id: 6, user_id: 5},
        {text: 'レッスンに行く', question_id: 6, user_id: 6}])