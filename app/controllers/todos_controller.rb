class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.js {}
      else
        render head: :no_content
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        redirect_to @todo, notice: 'Todo was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description, :status)
  end
end