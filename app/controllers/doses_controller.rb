class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :create, :edit ]
  before_action :find_dose, only: [ :edit, :update, :destroy ]

  # def new
  #   @dose = Dose.new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose added!'
    else
      render "cocktails/show"
    end
  end

  def edit
  end

  def update
    @dose.update(dose_params)

    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose updated!'
  end

  def destroy
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
