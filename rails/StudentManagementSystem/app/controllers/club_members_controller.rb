class ClubMembersController < ApplicationController
  before_action :set_club_member, only: %i[ show update destroy ]

  # GET /club_members
  # GET /club_members.json
  def index
    @club_members = ClubMember.all
  end

  # GET /club_members/1
  # GET /club_members/1.json
  def show
  end

  # POST /club_members
  # POST /club_members.json
  def create
    @club_member = ClubMember.new(club_member_params)

    if @club_member.save
      render :show, status: :created, location: @club_member
    else
      render json: @club_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /club_members/1
  # PATCH/PUT /club_members/1.json
  def update
    if @club_member.update(club_member_params)
      render :show, status: :ok, location: @club_member
    else
      render json: @club_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /club_members/1
  # DELETE /club_members/1.json
  def destroy
    @club_member.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_member
      @club_member = ClubMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_member_params
      params.require(:club_member).permit(:student_id, :club_id, :role, :status)
    end
end
