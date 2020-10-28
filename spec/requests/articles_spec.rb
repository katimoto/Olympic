require 'rails_helper'
describe ArticlesController, type: :request do

  before do
    @article = FactoryBot.build(:article)
    @article.image = fixture_file_upload('public/images/boat.png')
  end

  describe "GET #search" do
    it "searchアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get search_articles_path
      expect(response.status).to eq 200
    end
    it "searchアクションにリクエストするとレスポンスに投稿済みの記事のテキストが存在する" do 
      get search_articles_path
      expect(response.body).to include @article.text
    end
    it "searchアクションにリクエストするとレスポンスに投稿済みの記事のタイトルが存在する" do 
      get search_articles_path
      expect(response.body).to include @article.title
    end
    it "searchアクションにリクエストするとレスポンスに投稿済みの記事の画像が存在する" do 
      get search_articles_path
      expect(response.body).to include @article.image
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get article_path(@article)
      expect(response.status).to eq 200 
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの記事のテキストが存在する" do 
      get article_path(@article)
      expect(response.body).to include @article.text
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの記事の画像が存在する" do 
      get article_path(@article)
      expect(response.body).to include @article.image
    end
    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
      get article_path(@article)
      expect(response.body).to include "＜コメント一覧＞"
    end
  end
end
