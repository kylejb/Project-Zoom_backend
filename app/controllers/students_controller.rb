class StudentsController < ApplicationController
    #before_action :find_student, only: [:show]

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student.serializable_hash(include: {teachers: {only: 'name'}})
    end


    private

    def find_student
        @student = Student.find(params[:id])
    end
end
