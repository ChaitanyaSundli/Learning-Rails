class StudentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def student_params
        params.require(:student).permit(:name, :email, :dob, :phone, :address)
    end

    def index
        students = Student.all 
        render json: students
    end

    def show
        @student = Student.find(params[:id])
        render json: @student
    end

    def create
        student = Student.new(student_params)

        if student.save
            render json: student
        else
            render json: {errors: student.errors}
        end
    end

    
end
