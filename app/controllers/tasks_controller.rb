class TasksController < ApplicationController
  load_and_authorize_resource

  def show
    course = Course.friendly.find(params[:course_id])
    puts params
    @tasks = course.tasks
    @task = @tasks.friendly.find(params[:id])
  end
end
