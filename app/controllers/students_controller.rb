class StudentsController < ApplicationController

  def index
    puts "this it the param: #{params[:name]}"
    students =  if params[:name]
                  name = params[:name]
                  Student.where('first_name LIKE ? OR last_name LIKE ?', "%#{name}%", "%#{name}%")
                else
                  Student.all
                end
    render json: students
  end
  def show
    student = Student.find(params[:id])
    render json: student
  end


  # def self.search(name)
  #   Student.where('first_name LIKE ? OR last_name LIKE ?', "%#{name}%", "%#{name}%")
  # end
end
