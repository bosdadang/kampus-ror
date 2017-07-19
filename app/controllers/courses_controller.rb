class CoursesController < ApplicationController
  protect_from_forgery except: [:payment_notification]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @taks = @course.tasks
  end

  def subscrible
    @course = Course.find(params[:id])

    @subscription = Subscription.find_or_create_by(user: current_user, course_id: params[:id] )
    if @subscription.active?
      redirect_to my_courses_path
    else
      values = {
          business: "danyfirmansah-facilitator@yahoo.com",
          cmd: "_xclick",
          upload: 1,
          amount: @course.price,
          notify_url: "http://0.0.0.0:3000/payment_notification",
          item_name: @course.title,
          item_number:@subscription.id,
          quantity:1,
          return: "http://0.0.0.0:3000/my_courses"
      }
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?"+ values.to_query
    end
  end

  def my_courses
    @courses = current_user.courses
  end

  def payment_notification
    byebug
    params.permit!
    @subscription = Subscription.find(params[:item_number])
    @subscription.update_attributes({active: true})
    respond_to do |f|
      f.html {render text: "ok"}
    end
  end

end
