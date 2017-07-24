class CoursesController < ApplicationController
  protect_from_forgery except: [:payment_notification]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.friendly.find(params[:id])
    @taks = @course.tasks
  end

  def subscrible
    @course = Course.friendly.find(params[:id])
    @subscription = Subscription.find_or_create_by(user: current_user, course_id: @course.id)
    if @subscription.active?
      redirect_to @course
    else
      values = {
          business: "danyfirmansah-facilitator@yahoo.com",
          cmd: "_xclick",
          upload: 1,
          amount: @course.price,
          notify_url: "https://mysterious-wave-51030.herokuapp.com/payment_notification",
          item_name: @course.price,
          item_number: @subscription.id,
          quantity: 1,
          return: "https://mysterious-wave-51030.herokuapp.com/my_courses"
      }
      redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?"+ values.to_query
    end
  end

  def my_courses
    @courses = current_user.courses
  end

  def payment_notification
    params.permit!
    status = params[:payment_status]

    if status == "Completed"

      @subscription = Subscription.find(item_number)

      puts @subscription.active
      @subscription.update_attributes({active: true})

    end
    render nothing: true

  end

end
