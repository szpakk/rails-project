class TagsController < ApplicationController
	before_action :require_login, only: [:destroy]

	def index
		@tags = Tag.all
	end

	def show
	  @tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		Tagging.where(tag_id: params[:id]).destroy_all
		@tag.destroy

    flash.notice = "Tag '#{@tag.name}' Removed!"

		redirect_to tags_path
	end
end
