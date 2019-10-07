class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:show, :edit, :destroy]
  before_action :set_user, only: [ :show, :update, :delete ]
    
  # GET /homeworks
  # GET /homeworks.json
  def index 
    @homeworks = Homework.where(["homework_name LIKE ?","%#{params[:search]}%"])
  
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
    
  end

  # GET /homeworks/new
  def new
    @homework = Homework.new
    @category = Category.all
  end

  # GET /homeworks/1/edit
  def edit
  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = Homework.new(homework_params)
    
    respond_to do |format|
      if @homework.save #jika data berhasil disimpan
         @homework.update(created_by_id: current_user.id) 
         format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
         #menuju ke halaman show data dan menampilkan pesan "Homework was successfully created"
        
        format.json { render :show, status: :created, location: @homework }
      else #jika data tidak berhasil disimpan
        format.html { render :new }  
        #kembali ke halaman tambah data homework
        
        format.json { render json: @homework.errors, status: :unprocessable_entity }
        #memunculkan pesan error dalam bentuk json. Perhatikan bagian "@homework.errors"
      end
  end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def filtering_params(params)
      params.slice(:status, :location, :starts_with)
    end
    def set_user
      @user =User.new
    end
   
    def set_categories
      @category =Category.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_homework
      @homework = Homework.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homework_params
      params.require(:homework).permit(:homework_name, :category, :deadline, :description, :category_id, :destroy )
    end
end

