class Api::V1::SkiAreaReviewsController < Api::V1::GraphitiController
  def index
    ski_area_reviews = SkiAreaReviewResource.all(params)
    respond_with(ski_area_reviews)
  end

  def show
    ski_area_review = SkiAreaReviewResource.find(params)
    respond_with(ski_area_review)
  end

  def create
    ski_area_review = SkiAreaReviewResource.build(params)

    if ski_area_review.save
      render jsonapi: ski_area_review, status: 201
    else
      render jsonapi_errors: ski_area_review
    end
  end

  def update
    ski_area_review = SkiAreaReviewResource.find(params)

    if ski_area_review.update_attributes
      render jsonapi: ski_area_review
    else
      render jsonapi_errors: ski_area_review
    end
  end

  def destroy
    ski_area_review = SkiAreaReviewResource.find(params)

    if ski_area_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: ski_area_review
    end
  end
end
