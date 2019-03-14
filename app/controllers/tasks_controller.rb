class TasksController < ApplicationController

  before_action :set_params, only:[:show, :edit, :update, :destroy, ]

  def set_params
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "タスクを登録しました。"
      redirect_to @task
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "タスクを更新しました。"
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def index
    @tasks = Task.where(is_display: true).order(created_at: :desc).limit(5)
  end

  def hide
    @tasks = Task.where(is_display: false).order(created_at: :desc).limit(5)
  end

  private

    def task_params
      params.require(:task).permit(:title, :memo, :is_display, :status)
    end

end
