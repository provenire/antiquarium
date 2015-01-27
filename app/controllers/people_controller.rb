class PeopleController < ApplicationController
  include BasicFilters

  def index
    @people = PaginatingDecorator.new Person.order(:name).page(params[:page])
  end


  def show
    @person = Person.find(params[:id])
  end


  def new
    @person = Person.new
  end


  def create
    @person = Person.new(person_params)

    if @person.save
      flash.now[:success] = 'New person created.'
      redirect_to @person
    else
      render 'new'
    end
  end


  def edit
    @person = Person.find(params[:id])
  end


  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      flash.now[:success] = 'Person updated successfully.'
      redirect_to @person
    else
      render 'edit'
    end
  end


  def destroy
  end


  private

  def select_params
    params.permit(:fields)
  end

  def sort_params
    params.permit(:sort)
  end

  def limit_params
    params.permit(:limit)
  end

  def person_params
    params.require(:person).permit(
      :name,
      :description,
      :gender,
      :date_of_birth,
      :date_of_death,
      :nationality
    )
  end

end
