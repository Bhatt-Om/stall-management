class MenuCatogariesController < ApplicationController
  before_action :set_menu_catogary, only: %i[ show edit update destroy ]

  # GET /menu_catogaries or /menu_catogaries.json
  def index
    @menu_catogaries = MenuCatogary.all
  end

  # GET /menu_catogaries/1 or /menu_catogaries/1.json
  def show
  end

  # GET /menu_catogaries/new
  def new
    @menu_catogary = MenuCatogary.new
  end

  # GET /menu_catogaries/1/edit
  def edit
  end

  # POST /menu_catogaries or /menu_catogaries.json
  def create
    @menu_catogary = MenuCatogary.new(menu_catogary_params)

    respond_to do |format|
      if @menu_catogary.save
        format.html { redirect_to @menu_catogary, notice: "Menu catogary was successfully created." }
        format.json { render :show, status: :created, location: @menu_catogary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_catogaries/1 or /menu_catogaries/1.json
  def update
    respond_to do |format|
      if @menu_catogary.update(menu_catogary_params)
        format.html { redirect_to @menu_catogary, notice: "Menu catogary was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_catogary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_catogary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_catogaries/1 or /menu_catogaries/1.json
  def destroy
    @menu_catogary.destroy!

    respond_to do |format|
      format.html { redirect_to menu_catogaries_path, status: :see_other, notice: "Menu catogary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_catogary
      @menu_catogary = MenuCatogary.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def menu_catogary_params
      params.expect(menu_catogary: [ :name, :menu_id ])
    end
end
