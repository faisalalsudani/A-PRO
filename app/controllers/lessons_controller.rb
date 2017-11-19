class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end

  def show
    student = Student.find(params[:student_id])
    @lesson = student.lessons.find(params[:id])
  end

  def new
    student = Student.find(params[:student_id])
    @lesson = student.lessons.build
    @lesson = Lesson.new
  end

  def edit
    @student = Student.find(params[:student_id])
    @lesson = @student.lessons.find(params[:id])
  end

  def create
    student = Student.find(params[:student_id])

    @lesson = student.lessons.create(lesson_params)

      if @lesson.save
        redirect_to @lesson.student
        flash[:success] = "Les is opgeslaagd!"
      else
        redirect_to @lesson.student
        flash[:alert] = "Er is al les op deze tijd!"
      end

  end


  def update
    @student = Student.find(params[:student_id])
    @lesson = @student.lessons.find(params[:id])

    if @lesson.paid.nil?
      lesson_params[:paid] = true
      flash[:success] = "Les updated!"
    else
      flash[:success] = "Les updated!"
    end

    @lesson.update_attributes(lesson_params)
    redirect_to @lesson.student, notice: notice
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to @lesson.student
    flash[:alert] = "Les is verwijdert!"
  end



  private
  def lesson_params
    params.require(:lesson).permit(:date, :time, :paid)
  end

end
