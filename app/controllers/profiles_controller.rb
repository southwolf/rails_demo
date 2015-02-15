class ProfilesController < ApplicationController
  layout 'profile'

  # Current user's home page
  def home
    @profile = current_user.profile
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
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
end
