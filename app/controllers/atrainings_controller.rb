class AtrainingsController < ApplicationController
  before_action :set_atraining, only: [:show, :edit, :update, :destroy]

  # GET /atrainings
  # GET /atrainings.json
  def index
    @atrainings = Atraining.all
  end

  # GET /atrainings/1
  # GET /atrainings/1.json
  def show
  end

  # GET /atrainings/new
  def new
    @atraining = Atraining.new
  end

  # GET /atrainings/1/edit
  def edit
  end

  # POST /atrainings
  # POST /atrainings.json
  def create
    @atraining = Atraining.new(atraining_params)

    respond_to do |format|
      if @atraining.save
        format.html { redirect_to @atraining, notice: 'Atraining was successfully created.' }
        format.json { render action: 'show', status: :created, location: @atraining }
      else
        format.html { render action: 'new' }
        format.json { render json: @atraining.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atrainings/1
  # PATCH/PUT /atrainings/1.json
  def update
    respond_to do |format|
      if @atraining.update(atraining_params)
        format.html { redirect_to @atraining, notice: 'Atraining was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @atraining.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atrainings/1
  # DELETE /atrainings/1.json
  def destroy
    @atraining.destroy
    respond_to do |format|
      format.html { redirect_to atrainings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atraining
      @atraining = Atraining.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atraining_params
      params.require(:atraining).permit(:comment)
    end
end
