class FreelancersController < ApplicationController
  
  def index
  end
  
  def new
    if !user_signed_in?
      flash[:alert] = "로그인이 필요합니다!"
      redirect_to new_user_session_path
    end
  end
  
  def category
    @category = Category.new(category_new)
  
    if (@category.category == "영상")
      redirect_to video_new_path
    elsif (@category.category == "디자인")
      redirect_to design_new_path
    end
  end
  
  def ready
  end
  
  def about
  end
  
  def video
    @videos = Video.all
  end
  
  def video_new
    @video = Video.new
    @video_attachment = @video.video_attachments.build
  end
  
  def video_edit
    @video = Video.find(params[:id])
  end
  
  def video_create
    @video = Video.new(video_params)
    
    respond_to do |format|
      if @video.save
        params[:video_attachments]['portfolio'].each do |a|
          @video_attachment = @video.video_attachments.create!(:portfolio => a, :video_id => @video.id)
        end
        format.html { redirect_to action: "video_show", id: @video.id, notice: 'Video was successfully created.' }
      end
    end
  end
  
  def video_show
    @video = Video.find(params[:id])
    @video_attachments = @video.video_attachments.all
  end
  
  def video_update
    @video = Video.find(params[:id])
    
    respond_to do |format|
      if @video.update(video_update_params)
        format.html { redirect_to action: "video_show", id: @video.id, notice: 'Video was successfully updated.' }
      end
    end
  end
  
  def video_destroy
    @video = Video.find(params[:id])
    
    # @video.remove_locallage!      //다른글까지 삭제되서 일단 주석처리 했지만 나중에 데이터 낭비가 있을 수 있음 처리해야함
   
    # @video.video_attachments.each do |attachment|
    #   attachment.remove_portfolio!
    # end
    
    @video.destroy
    
    respond_to do |format|
      format.html { redirect_to action: "video", notice: 'Video was successfully destroyed.' }
    end
  end
  
  def design
    @designs = Design.all
  end
  
  def design_new
    @design = Design.new
    @design_attachment = @design.design_attachments.build
  end
  
  def design_edit
    @design = Design.find(params[:id])
  end
  
  def design_create
    @design = Design.new(design_params)
    
    respond_to do |format|
      if @design.save
        params[:design_attachments]['portfolio'].each do |a|
          @design_attachment = @design.design_attachments.create!(:portfolio => a, :design_id => @design.id)
        end
        format.html { redirect_to action: "design_show", id: @design.id, notice: 'Design was successfully created.' }
      end
    end
  end
  
  def design_show
    @design = Design.find(params[:id])
    @design_attachments = @design.design_attachments.all
  end
  
  def design_update
    @design = Design.find(params[:id])
    
    respond_to do |format|
      if @design.update(design_update_params)
        format.html { redirect_to action: "design_show", id: @design.id, notice: 'Design was successfully updated.' }
      end
    end
  end
  
  def design_destroy
    @design = Design.find(params[:id])
    
    # @design.remove_locallage!     //다른글까지 삭제되서 일단 주석처리 했지만 나중에 데이터 낭비가 있을 수 있음 처리해야함
   
    # @design.design_attachments.each do |attachment|
    #   attachment.remove_portfolio!
    # end
    
    @design.destroy
    
    respond_to do |format|
      format.html { redirect_to action: "design", notice: 'Design was successfully destroyed.' }
    end
  end
  
  
  private
    def category_new
      params.require(:category).permit(:category)
    end
    
    def video_params
      params.require(:video).permit(:title, :university, :grade, :content, :locallage, :user_id, video_attachments_attributes: [:id, :video_id, :portfolio])
    end
    
    def design_params
      params.require(:design).permit(:title, :university, :grade, :content, :locallage, :user_id, design_attachments_attributes: [:id, :design_id, :portfolio])
    end
    
    def video_update_params
      params.require(:video).permit(:title, :university, :grade, :content, :locallage, video_attachments_attributes: [:id, :video_id, :portfolio])
    end
    
    def design_update_params
      params.require(:design).permit(:title, :university, :grade, :content, :locallage, design_attachments_attributes: [:id, :design_id, :portfolio])
    end
      
end
