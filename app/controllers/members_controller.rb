class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @members = Member.all
    respond_with(@members)
  end

  def show
    respond_with(@member)
  end

  def new
    @member = Member.new
    respond_with(@member)
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    flash[:notice] = 'Member was successfully created.' if @member.save
    respond_with(@member)
  end

  def update
    flash[:notice] = 'Member was successfully updated.' if @member.update(member_params)
    respond_with(@member)
  end

  def destroy
    @member.destroy
    respond_with(@member)
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:name, :uname, :dob, :gender, :contact, :email, :mpass, :cmpass)
    end
end
