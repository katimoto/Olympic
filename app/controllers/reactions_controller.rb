class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reaction, only: [:show, :edit, :update, :destroy]
  @@answer_id = nil
  
  def index
    @reactions = Reaction.all
  end
 
  def show
  end
 
  def new
    @@answer_id = params[:answerId]
    @answer = Answer.find(@@answer_id)
    @reaction = Reaction.new
  end
 
  def edit
  end
 
  def create
    @reaction = Reaction.new(reaction_params)
    @reaction.answer_id = @@answer_id
    @reaction.user_id = current_user.id
    respond_to do |format|
      if @reaction.save
        format.html {redirect_to @reaction, notice: 'Reaction was successfully created.'}
        format.json {render :show, status: :created, location: @reaction}
      else
        format.html {render :new}
        format.json {render json: @reaction.errors, status: :unprocessable_entity}
      end
    end
  end
 
  def update
    respond_to do |format|
      if @reaction.update(reaction_params)
        format.html {redirect_to @reaction, notice: 'Reaction was successfully updated.'}
        format.json {render :show, status: :ok, location: @reaction}
      else
        format.html {render :edit}
        format.json {render json: @reaction.errors, status: :unprocessable_entity}
      end
    end
  end
 
  def destroy
    @reaction.destroy
    respond_to do |format|
      format.html {redirect_to reactions_url, notice: 'Reaction was successfully destroyed.'}
      format.json {head :no_content}
    end
  end
 
  private
 
  def set_reaction
    @reaction = Reaction.find(params[:id])
  end
 
  def reaction_params
    params.require(:reaction).permit(:user_id, :answer_id, :body)
  end
end
