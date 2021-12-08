class Api::V1::SkiCheckInsController < Api::V1::GraphitiController
  def index
    ski_check_ins = SkiCheckInResource.all(params)
    respond_with(ski_check_ins)
  end

  def show
    ski_check_in = SkiCheckInResource.find(params)
    respond_with(ski_check_in)
  end

  def create
    ski_check_in = SkiCheckInResource.build(params)

    if ski_check_in.save
      render jsonapi: ski_check_in, status: :created
    else
      render jsonapi_errors: ski_check_in
    end
  end

  def update
    ski_check_in = SkiCheckInResource.find(params)

    if ski_check_in.update_attributes
      render jsonapi: ski_check_in
    else
      render jsonapi_errors: ski_check_in
    end
  end

  def destroy
    ski_check_in = SkiCheckInResource.find(params)

    if ski_check_in.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: ski_check_in
    end
  end
end
