module API::V1
  class TaskTypesController < ApplicationController
    before_action :set_task_type, only: %i[show update destroy]

    # GET /task_types
    def index
      @task_types = TaskType.all.with_attached_avatar
      # TODO: create seralizer imagable
      # render json: @task_types.map { |task_type|
      #   task_type.as_json.merge({ image: url_for(task_type.avatar) })
      # }
      render json: TaskTypeSerializer.new(@task_types).serializable_hash
    end

    # GET /task_types/1
    def show
      render json: @task_type
    end

    # POST /task_types
    def create
      # TODO: resize image with worker and Queue Async way
      @task_type = TaskType.new(task_type_params)

      if @task_type.save
        render json: @task_type, status: :created, location: @task_type
      else
        render json: @task_type.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /task_types/1
    def update
      if @task_type.update(task_type_params)
        render json: @task_type
      else
        render json: @task_type.errors, status: :unprocessable_entity
      end
    end

    # DELETE /task_types/1
    def destroy
      @task_type.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_task_type
      @task_type = TaskType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_type_params
      params.require(:task_type).permit(:name, :image_path, :image_original_name, :avatar)
    end
  end
end
