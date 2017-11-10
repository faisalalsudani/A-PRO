class StudentsController < ApplicationController
  def index
   @students = Student.all
   @lessons = Lesson.new
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

 def destroy
   @student = Student.find(params[:id])
   @student.destroy

   redirect_to action: "index"
 end

 private
 def student_params
   params.require(:student).permit(:name, :phone, :bsn_num)
 end

end
