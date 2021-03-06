User.create(
    [
        {name: '佐々木太郎', email: 'sitsumon2@gmail.com', password: 'aoyashi123', password_confirmation: 'aoyashi123', category_id: 7},
        {name: '田中太郎', email: 'sitsumon3@gmail.com', password: 'ioyashi123', password_confirmation: 'ioyashi123', category_id: 9},
        {name: '高橋花子', email: 'kaitou1@gmail.com', password: 'uoyashi123', password_confirmation: 'uoyashi123', category_id: 1},
        {name: '斎藤花子', email: 'kaitou2@gmail.com', password: 'eoyashi123', password_confirmation: 'eoyashi123', category_id: 1},
        {name: '宮本太郎', email: 'sitsumon4@gmail.com', password: 'ooyashi123', password_confirmation: 'ooyashi123', category_id: 1},
        {name: '宇多川太郎', email: 'sitsumon5@gmail.com', password: 'koyashi123', password_confirmation: 'koyashi123', category_id: 1},
        {name: '新橋太郎', email: 'sitsumon6@gmail.com', password: 'soyashi123', password_confirmation: 'soyashi123', category_id: 3},
        {name: '坂本花子', email: 'kaitou4@gmail.com', password: 'toyashi123', password_confirmation: 'toyashi123', category_id: 3},
        {name: '斎藤今日子', email: 'kaitou5@gmail.com', password: 'noyashi123', password_confirmation: 'noyashi123', category_id: 1},
        {name: 'ゲストユーザー', email: 'guest@gmail.com', password: 'guest123', password_confirmation: 'guest123', category_id: 1},
        {name: '鈴木太郎', email: 'sitsumon1@gmail.com', password: 'moyashi123', password_confirmation: 'moyashi123', category_id: 3},
        {name: '池田リナ', email: 'kaitou6@gmail.com', password: 'yoyashi123', password_confirmation: 'yoyashi123', category_id: 5}])
 
Question.create(
    [
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', category_id: 4, user_id: 8},
        {title: '東京のお土産で喜ばれるもの', text: '今週末東京に行きますが、東京土産で喜ばれるものありますか？', category_id: 8, user_id: 1},
        {title: '好きな動物', text: '一番好きな動物は何ですか？', category_id: 9, user_id: 9},
        {title: '美味しいご飯や', text: '名古屋周辺の美味しいご飯屋さん教えてください', category_id: 1, user_id: 1},
        {title: '明日の天気', text: '明日の天気は？', category_id: 1,  user_id: 2},
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', category_id: 1,  user_id: 1},                
        {title: '英語の勉強法', text: '英語はどうやって勉強したらいいですか？', category_id: 1,  user_id: 3},
        {title: 'メッシのドリブルについて', text: 'メッシのドリブルはどこがすごいのでしょうか？', category_id: 2, user_id: 10},
        {title: 'ドレセルのドルフィンキック', text: 'ドレセルのドルフィンキックはなぜ他の選手に比べて速いのでしょうか？', category_id: 2, user_id: 10},
        {title: 'ストローク回数', text: 'オリンピック選手のストローク数が２０年前に比べて約半分になっているのはどういった原理ですか?', category_id: 3, user_id: 10},
        {title: '470の寸法', text: '縦横高さと重さの一般的な数値を教えて', category_id: 2, user_id: 10},
        {title: 'フォアのテンション', text: 'フリーの時、フォアのテンションはどのように関係してくるのでしょうか？また、ジブのサギングは影響があるのでしょうか？
                本によって書いてある事が違う（状況によって異なるだけなのかもしれませんが・・・）ため、またコーチがいないため、答えが出ません。
                よろしくお願いします。', category_id: 3, user_id: 1},
        {title: 'ガスケットについて', text: '	ガスケットを修理する場合の張り方、はがれない接着剤等を教えてもらいたいのですが。', category_id: 4, user_id: 10},
        {title: '新艇はなぜ早い？', text: '変な質問で恐縮ですが、新艇はなぜ早いのでしょうか？
                多く使う船は何が原因で遅くなるのでしょうか？
                また、マストだけを変えても速くなるものなのでしょうか？', category_id: 5, user_id: 4},
        {title: 'セールに合うベンド量', text: 'セールを見ただけで、そのセールに合うベンド量を知る方法ってありますか？', category_id: 6, user_id: 3},
        {title: 'ウェザーヘルムについて', text: '基本的な質問で申し訳ありません。
                よく「ヘルムは若干のウェザーヘルムを感じるくらいに」と言いますが、これだとなぜ良いのですか？
                ニュートラルヘルムになることで何か不都合はあるのでしょうか？
                前に重複する質問があったら申し訳ありません。', category_id: 6, user_id: 10}])
 
Answer.create(
    [
        {text: '正確な数値は４７０協会に問い合わせたほうが正確です。長さ４７００ｍｍ幅１６８０ｍｍです。高さはおよそ８００ｍｍ位でしょうか。重量はおよそ１２０Kg位です。', question_id: 10, user_id: 4},
        {text: 'ジブもフリーになれば外に出してリーチにテンションをかけてパワーを得ると速く走れるようになります。
                メインセールにはブームがありそしてブームにはバングがついています。
                メインシートでブームの位置をコントロールしてバングでリーチのテンションをコントロールできます。
                ところがジブセールにはブームがなくバングもありません。', question_id: 15, user_id: 5},
        {text: 'バランスが良いからだと思います。
                前後、左右、上下、狂わないように作ります。
                乗るようになればそのバランスが少しずつ狂ってくると思います。
                たとえば船がよじれてくるとか艤装品のついているものが高くなったり低くなったり前後に動いたり左右にぶれたりします。
                左右や前後、上下バランスを確認していってください。', question_id: 16, user_id: 6},
        {text: 'ガスケットを張るには両面テープを使うのが一般的になっています。
                両面テープを選ぶ時は室内用より室外用を選ぶと良いです。
                特に自動車部品を取りつけるようなものはお勧めです。
                水に強いものが良いです。', question_id: 13, user_id: 4},
        {text: 'ベンドで変わるものはドラフトの位置です。
                ドラフト位置がセールプラント一致するところがベンド量と考えて良いでしょう。
                ドラフト位置は前後何パーセントと表現するのが一般的だと思います。', question_id: 15, user_id: 5},
        {text: 'もちろんニュートラルヘルムのほうが抵抗が少なくて良いです。
                恐らく速く走りたくてヘルムを考えていると思います。
                速く走るにはまっすぐ走ることです。
                まっすぐに走るにはニュートラルのヘルムのほうが良いです。', question_id: 16, user_id: 6},
        {text: '矢場とん', question_id: 13, user_id: 4},
        {text: '山ちゃん', question_id: 13, user_id: 5},
        {text: 'みせん', question_id: 13, user_id: 6},
        {text: '晴れ', question_id: 14, user_id: 4},
        {text: '曇り', question_id: 14, user_id: 5},
        {text: '雨', question_id: 14, user_id: 6},
        {text: '1時間', question_id: 15, user_id: 4},
        {text: '2時間', question_id: 15, user_id: 5},
        {text: '3時間', question_id: 15, user_id: 6},
        {text: '特かく話す', question_id: 16, user_id: 4},
        {text: '単語の勉強', question_id: 16, user_id: 5},
        {text: 'レッスンに行く', question_id: 16, user_id: 6}])

Article.create(
    [
        { title: '読書時間について', text: '一日の読書時間はどれぐらい？',user_id: 8},
        { title: '東京のお土産で喜ばれるもの', text: '今週末東京に行きますが、東京土産で喜ばれるものありますか？',user_id: 1},
        {title: '好きな動物', text: '一番好きな動物は何ですか？',user_id: 9},
        { title: '美味しいご飯や', text: '名古屋周辺の美味しいご飯屋さん教えてください', user_id: 10},
        { title: '明日の天気', text: '明日の天気は？', user_id: 2},
        {title: '読書時間について', text: '一日の読書時間はどれぐらい？', user_id: 3},                
        { title: '英語の勉強法', text: '英語はどうやって勉強したらいいですか？', user_id: 3},
        {title: 'メッシのドリブルについて', text: 'メッシのドリブルはどこがすごいのでしょうか？',user_id: 5},
        { title: 'ドレセルのドルフィンキック', text: 'ドレセルのドルフィンキックはなぜ他の選手に比べて速いのでしょうか？',user_id: 2},
        { title: 'ストローク回数', text: 'オリンピック選手のストローク数が２０年前に比べて約半分になっているのはどういった原理ですか?',user_id: 5},
        { title: '470の寸法', text: '縦横高さと重さの一般的な数値を教えて',user_id: 1},
        { title: 'フォアのテンション', text: 'フリーの時、フォアのテンションはどのように関係してくるのでしょうか？また、ジブのサギングは影響があるのでしょうか？
                本によって書いてある事が違う（状況によって異なるだけなのかもしれませんが・・・）ため、またコーチがいないため、答えが出ません。
                よろしくお願いします。',user_id: 1},
        { title: 'ガスケットについて', text: '	ガスケットを修理する場合の張り方、はがれない接着剤等を教えてもらいたいのですが。',user_id: 2},
        { title: '新艇はなぜ早い？', text: '変な質問で恐縮ですが、新艇はなぜ早いのでしょうか？
                多く使う船は何が原因で遅くなるのでしょうか？
                また、マストだけを変えても速くなるものなのでしょうか？',user_id: 4},
        { title: 'セールに合うベンド量', text: 'セールを見ただけで、そのセールに合うベンド量を知る方法ってありますか？',user_id: 3},
        { title: 'ウェザーヘルムについて', text: '基本的な質問で申し訳ありません。
                よく「ヘルムは若干のウェザーヘルムを感じるくらいに」と言いますが、これだとなぜ良いのですか？
                ニュートラルヘルムになることで何か不都合はあるのでしょうか？
                前に重複する質問があったら申し訳ありません。',user_id: 1}])


Comment.create(
    [
        {text: '正確な数値は４７０協会に問い合わせたほうが正確です。長さ４７００ｍｍ幅１６８０ｍｍです。高さはおよそ８００ｍｍ位でしょうか。重量はおよそ１２０Kg位です。', article_id: 11, user_id: 4},
        {text: 'ジブもフリーになれば外に出してリーチにテンションをかけてパワーを得ると速く走れるようになります。
                メインセールにはブームがありそしてブームにはバングがついています。
                メインシートでブームの位置をコントロールしてバングでリーチのテンションをコントロールできます。
                ところがジブセールにはブームがなくバングもありません。', article_id: 12, user_id: 5},
        {text: 'バランスが良いからだと思います。
                前後、左右、上下、狂わないように作ります。
                乗るようになればそのバランスが少しずつ狂ってくると思います。
                たとえば船がよじれてくるとか艤装品のついているものが高くなったり低くなったり前後に動いたり左右にぶれたりします。
                左右や前後、上下バランスを確認していってください。', article_id: 14, user_id: 6},
        {text: 'ガスケットを張るには両面テープを使うのが一般的になっています。
                両面テープを選ぶ時は室内用より室外用を選ぶと良いです。
                特に自動車部品を取りつけるようなものはお勧めです。
                水に強いものが良いです。', article_id: 13, user_id: 4},
        {text: 'ベンドで変わるものはドラフトの位置です。
                ドラフト位置がセールプラント一致するところがベンド量と考えて良いでしょう。
                ドラフト位置は前後何パーセントと表現するのが一般的だと思います。', article_id: 15, user_id: 5},
        {text: 'もちろんニュートラルヘルムのほうが抵抗が少なくて良いです。
                恐らく速く走りたくてヘルムを考えていると思います。
                速く走るにはまっすぐ走ることです。
                まっすぐに走るにはニュートラルのヘルムのほうが良いです。', article_id: 16, user_id: 6},
        {text: '矢場とん', article_id: 13, user_id: 4},
        {text: '山ちゃん', article_id: 13, user_id: 5},
        {text: 'みせん', article_id: 13, user_id: 6},
        {text: '晴れ', article_id: 14, user_id: 4},
        {text: '曇り', article_id: 14, user_id: 5},
        {text: '雨', article_id: 14, user_id: 6},
        {text: '1時間', article_id: 15, user_id: 4},
        {text: '2時間', article_id: 15, user_id: 5},
        {text: '3時間', article_id: 15, user_id: 6},
        {text: '特かく話す', article_id: 16, user_id: 4},
        {text: '単語の勉強', article_id: 16, user_id: 5},
        {text: 'レッスンに行く', article_id: 16, user_id: 6}])