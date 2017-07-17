module Api
	module V1
		class RacesController < ApplicationController
			before_action :set_race, only: [:show, :update, :destroy]
			# GET /races/page
			def index
				@races = Race.order(:name).page(params[:page])
				total_page = Race.order(:name).page(params[:page]).total_pages
				render json: {data:@races,pages: total_page,records: Race.all.count}
			end

			# GET /races/1
			def show
				render json: @race
			end

			# POST /races
			def create
				@race = Race.new(race_params)

				if @race.save
					render json: @race, status: :created
				else
					render json: @race.errors, status: :unprocessable_entity
				end
			end

			# PATCH/PUT /races/1
			def update
				if @race.update(race_params)
					render json: @race
				else
					render json: @race.errors, status: :unprocessable_entity
				end
			end

			# DELETE /races/1
			def destroy
				@race.destroy
			end

			private
				# Use callbacks to share common setup or constraints between actions.
				def set_race
					@race = Race.find(params[:id])
				end

				# Only allow a trusted parameter "white list" through.
				def race_params
					params.require(:race).permit(:name)
				end
		end
	end
end

