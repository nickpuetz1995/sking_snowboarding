class Api::V1::NonSkiReviewsController < Api::V1::GraphitiController
  def index
    non_ski_reviews = NonSkiReviewResource.all(params)
    respond_with(non_ski_reviews)
  end

  def show
    non_ski_review = NonSkiReviewResource.find(params)
    respond_with(non_ski_review)
  end

  def create
    non_ski_review = NonSkiReviewResource.build(params)

    if non_ski_review.save
      render jsonapi: non_ski_review, status: 201
    else
      render jsonapi_errors: non_ski_review
    end
  end

  def update
    non_ski_review = NonSkiReviewResource.find(params)

    if non_ski_review.update_attributes
      render jsonapi: non_ski_review
    else
      render jsonapi_errors: non_ski_review
    end
  end

  def destroy
    non_ski_review = NonSkiReviewResource.find(params)

    if non_ski_review.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: non_ski_review
    end
  end
end
