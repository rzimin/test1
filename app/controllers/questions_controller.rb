class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show

  end

  # GET /questions/new
  def new
  
    @pools = Pool.all
    @question = Question.new
  
  end

  # GET /questions/1/edit
  def edit
    @pools = Pool.all
    @options = Option.where(question_id: params[:id])
    @used_pools = QuestionPool.where(question_id: params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    
    

    respond_to do |format|
      if @question.save
        qid = @question.id
        unless params[:pool].nil? 
          new_pools = params[:pool].each.map(&:to_i)
          new_pools.each do |pool|
            QuestionPool.find_or_create_by(question_id: qid, pool_id: pool)
          end
        end

        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      #if @question.update(question_params)
    current_pools = Question.find(params[:id]).pools.pluck(:id)
    logger.info "----- current pools ---" + current_pools.to_s
    unless params[:pool].nil?
    new_pools = params[:pool].each.map(&:to_i)
    else new_pools = []
    end

    logger.info "----- new pools ---" + new_pools.to_s
    candidate_del = current_pools - new_pools
    logger.info candidate_del
    candidate_add = new_pools - current_pools    
    
    candidate_del.each do |pool|
      logger.info "------------------Processing the request..."
      QuestionPool.where(question_id: params[:id], pool_id: pool).destroy_all

    end

    candidate_add.each do |pool|
      QuestionPool.find_or_create_by(question_id: params[:id], pool_id: pool)
    end

    
      
        #if @question.pools.update(params[:pool].keys,params.values)
        if true
                  format.html { render action: 'show' }
        #format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content)
    end
end
