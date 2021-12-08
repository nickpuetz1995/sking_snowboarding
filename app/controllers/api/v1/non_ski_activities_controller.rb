class Api::V1::NonSkiActivitiesController < Api::V1::GraphitiController
  def index
    non_ski_activities = NonSkiActivityResource.all(params)
    respond_with(non_ski_activities)
  end

  def show
    non_ski_activity = NonSkiActivityResource.find(params)
    respond_with(non_ski_activity)
  end

  def create
    non_ski_activity = NonSkiActivityResource.build(params)

    if non_ski_activity.save
      render jsonapi: non_ski_activity, status: :created
    else
      render jsonapi_errors: non_ski_activity
    end
  end

  def update
    non_ski_activity = NonSkiActivityResource.find(params)

    if non_ski_activity.update_attributes
      render jsonapi: non_ski_activity
    else
      render jsonapi_errors: non_ski_activity
    end
  end

  def destroy
    non_ski_activity = NonSkiActivityResource.find(params)

    if non_ski_activity.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: non_ski_activity
    end
  end
end
