class StudentsController < ApplicationController

  before_action :authenticate_user!

  def index
   @students = Student.all
   @lessons = Lesson.all
   @lesson = Lesson.new
 end

 def new
   @student = Student.new
 end

 def create
   @student = Student.new(student_params)
   if @student.save
     redirect_to action: "index", notice: "Student created!"
   else
     render :index
   end
 end

 def show
   @student = Student.find(params[:id])
   @lessons = @student.lessons
   @lesson = Lesson.new
 end

 def edit
   @stundet = Student.find(params[:id])
   @lesson = @stundet.lessons.find(params[:id])
 end

 def update
   @student = Student.find(params[:id])
   if @student.update_attributes(student_params)
     redirect_to @student.lesson, notice: "Evaluation updated"
   else
     render :edit
   end

   if @student.update(student_params)
     redirect_to @student, notice: "student updated"
   else
     render :edit
   end
 end

 def destroy
   @student = Student.find(params[:id])
   @student.destroy

   redirect_to students_path
 end

 private
 def student_params
   params.require(:student).permit(:name, :phone, :bsn_num, :praktijk, :theorie)
 end



end
