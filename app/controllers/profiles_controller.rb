class ProfilesController < ApplicationController

  layout :dynamic_layout
  respond_to :json, :html

  # Current user's home page
  def home
    @profile = current_user.profile
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render json: @profile.to_json }
      else
        format.html { render :edit }
        format.json { render json: {err: @profile.errors.full_messages.join(',')} }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name)
  end

  def dynamic_layout
    if action_name == 'home'
      'profile'
    elsif action_name == 'show'
      'profile_at_right'
    end
  end
end
