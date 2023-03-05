# rubocop:disable Style/Documentation
# frozen_string_literal: true

class Career < ApplicationRecord
  has_many :subjects, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

class Subject < ApplicationRecord
  belongs_to :career
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

class CareersController < ApplicationController
  def index
    @careers = Career.all
  end

  def show
    @career = Career.find(params[:id])
    @subjects = @career.subjects
  end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    if @career.save
      redirect_to careers_path, notice: 'La carrera se ha creado correctamente.'
    else
      render :new
    end
  end

  def destroy
    @career = Career.find(params[:id])
    @career.destroy
    redirect_to careers_path, notice: 'La carrera se ha eliminado correctamente.'
  end

  private

  def career_params
    params.require(:career).permit(:name, :description, :price)
  end
end

# this class do something ...
class SubjectsController < ApplicationController
  before_action :set_career, only: %i[new create]
  before_action :set_subject, only: %i[show destroy]

  def show; end

  def new
    @subject = @career.subjects.build
  end

  def create
    @subject = @career.subjects.build(subject_params)
    if @subject.save
      redirect_to @career, notice: 'La materia se ha creado correctamente.'
    else
      render :new
    end
  end

  def destroy
    @subject.destroy
    redirect_to @subject.career, notice: 'La materia se ha eliminado correctamente.'
  end

  private

  def set_career
    @career = Career.find(params[:career_id])
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :description, :price)
  end
end

# rubocop:enable Style/Documentation
