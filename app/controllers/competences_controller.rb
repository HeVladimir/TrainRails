class CompetencesController < ApplicationController
  before_action :set_competence, only: [:show, :edit, :update, :destroy]

  # admin@gmail.com
  # 123456

  # user.gmail.com
  # 123456

  def index
    @competences = Competence.all

  end

  def show
  end

  def edit
    @user = User.find_by_id(@competence.user_id)
  end

  def destroy
    @competence.destroy
    respond_to do |format|
      format.html { redirect_to competences_url, notice: 'Competence was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def create
    @competence = Competence.new(competence_params)
    @competence.user_id = current_user.id
    respond_to do |format|
      if @competence.save
        format.html { redirect_to @competence, notice: 'Competence was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @user = User.find_by_id(@competence.user_id)
      if @competence.update(competence_params)
        format.html { redirect_to @competence, notice: 'Competence was successfully updated.' }
        format.json { render :show, status: :ok, location: @competence }
      else
        format.html { render :edit }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    if user_signed_in? && current_user.admin
        @competence = Competence.new
    else
      render_403
    end

  end


private

  def set_competence
    @competence = Competence.find(params[:id])
  end

  def competence_params
    params.require(:competence).permit(:name, :lvl, :user_id)
  end

end
