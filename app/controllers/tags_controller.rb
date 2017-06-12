class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
	  @tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@taggings = Tagging.where(tag_id: @tag.id)
		@taggings.each do |tagging|
			tagging.destroy
		end
		@tag.destroy

    flash.notice = "Tag '#{@tag.name}' Removed!"

		redirect_to tags_path
	end
end
