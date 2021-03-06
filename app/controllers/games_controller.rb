class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  skip_before_action  :authorized, only: [:index, :show, :create]

  # GET /games
  def index
    results = []
    User.all.each do |user|
      results << {
        username: user.username,
        win_count: user.win,
        loss_count: user.loss
      }
    end
    results = results.sort_by{|result| result[:win_count]}.reverse
    render json: {message: 'leaderboard success', success: true, data: results}, status: 200
  end
  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  # def create
  #   @game = Game.new(game_params)
  #
  #   if @game.save
  #     render json: @game, status: :created, location: @game
  #   else
  #     render json: @game.errors, status: :unprocessable_entity
  #   end
  # end
  #
  def create
  @game = Game.new(game_params)

  if @game.save
    render json: {message: 'game has been created', success: true, data: @game}, status:200
  else
    render json: {message: 'game has not been created', success: false, data: @game.errors}, status:406

end
end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.permit(:id)
    end
end
