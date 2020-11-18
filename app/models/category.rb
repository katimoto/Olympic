class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'サッカー' },
    { id: 3, name: '野球' },
    { id: 4, name: 'バスケ' },
    { id: 5, name: 'ヨット' },
    { id: 6, name: '陸上' },
    { id: 7, name: '柔道' },
    { id: 8, name: 'スケートボード' },
    { id: 9, name: 'サーフィン' },
    { id: 10, name: 'アメリカンフットボール' },
    { id: 11, name: 'テニス' },
    { id: 12, name: 'フェンシング' },
    { id: 13, name: 'スノーボード' },
    { id: 14, name: 'スキー' },
    { id: 15, name: '水泳' },
    { id: 16, name: 'ラグビー' },
    { id: 17, name: '卓球' },
    { id: 18, name: 'バドミントン' },
    { id: 19, name: 'アイスホッケー' },
    { id: 20, name: 'その他' }
  ]

  def self.category(category)
    if 1 < params[:id].to_i && params[:id].to_i < 21
      Question.where(category_id: params[:id])
    else 
      Question.all
    end
  end
end

