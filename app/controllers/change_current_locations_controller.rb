# Controller for the batch update for current locations
class ChangeCurrentLocationsController < ApplicationController
  load_and_authorize_resource
  def new
    @change_current_location = ChangeCurrentLocation.new
  end

  def create
    @change_current_location = ChangeCurrentLocation.new(change_current_location_params)
    if @change_current_location.valid?
      array_of_item_ids = @change_current_location.parse_uploaded_file
      filtered_item_ids = UniUpdates.filter_duplicates(array_of_item_ids)
      uniques = filtered_item_ids[0]
      duplicates = filtered_item_ids[1].join(' ')
      @uni_updates_batch = UniUpdatesBatch.create_current_location_batch(params, uniques.count)
      UniUpdates.create_for_batch(uniques, @uni_updates_batch)
      WebformsMailer.batch_upload_email(@uni_updates_batch, duplicates).deliver_now
      flash[:notice] = 'Batch uploaded!'
      redirect_to uni_updates_batch_path(@uni_updates_batch, duplicates: duplicates)
    else
      render action: 'new'
    end
  end

  private

  def change_current_location_params
    params.require(:change_current_location).permit(:current_library,
                                                    :new_current_location,
                                                    :new_item_type,
                                                    :item_ids, :email, :comments,
                                                    :load_date, :user_name,
                                                    :action, :priority,
                                                    :export_yn, :check_bc_first)
  end
end
