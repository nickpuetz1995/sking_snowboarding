class Api::V1::SkiAreasController < Api::V1::GraphitiController
  def index
    ski_areas = SkiAreaResource.all(params)
    respond_with(ski_areas)
  end

  def show
    ski_area = SkiAreaResource.find(params)
    respond_with(ski_area)
  end

  def create
    ski_area = SkiAreaResource.build(params)

    if ski_area.save
      render jsonapi: ski_area, status: :created
    else
      render jsonapi_errors: ski_area
    end
  end

  def update
    ski_area = SkiAreaResource.find(params)

    if ski_area.update_attributes
      render jsonapi: ski_area
    else
      render jsonapi_errors: ski_area
    end
  end

  def destroy
    ski_area = SkiAreaResource.find(params)

    if ski_area.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: ski_area
    end
  end
end
