class Instructor < ActiveRecord::Base
  include UsersHelper
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  # has_many :grades
  has_many :courses

  validates :email, uniqueness: true
  validates_presence_of :first_name, :last_name, :email
  validates :password, confirmation: true, on: :create
  validates :email, format: { with: /\A\S+[@]\S+[.]\S+/ }
	has_many :wats
	has_many :students, through: :courses

  def my_students
    students.uniq
  end
  # [{ course: { name: 'somename' }, gpa: 3.4 }]

  def grades
    get_all_grades
    group_grades_by_course
    p average_grades
  end

  def average_grades
    @grades_hash.each { |k, v| p v[0].class }
    @output = []
    @grades_hash.map do |course_id, grades|
      p course_id
      p grades[0].gpa
      course_hash = {}
      course_hash[:course] = { name: Course.find(course_id).name }
      sum = 0.to_f
      grades.each do |grade|
        sum += grade.gpa
      end
      course_hash[:gpa] = sum / grades.length
      @output << course_hash
    end
    @output
  end

  def group_grades_by_course
    @grades_hash = @raw_grades.group_by(&:course_id)
  end

  def get_all_grades
    @raw_grades = []
    my_students.each do |student|
      @raw_grades << Grade.where(student_id: student.id)
    end
    @raw_grades.flatten!
  end
end
